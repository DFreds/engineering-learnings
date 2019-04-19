package com.demo.api.models.serializers;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import java.io.IOException;
import org.joda.time.DateTime;

public class DateTimeDeserializer extends JsonDeserializer<DateTime> {

  @Override
  public DateTime deserialize(JsonParser p, DeserializationContext ctxt)
      throws IOException, JsonProcessingException {
    return DateTime.parse(p.getText());
  }
}
