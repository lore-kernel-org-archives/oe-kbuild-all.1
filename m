Received: from sonic307-22.consmr.mail.sg3.yahoo.com (sonic307-22.consmr.mail.sg3.yahoo.com [106.10.241.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28511799F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 00:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752711741; cv=none; b=VtNs/wjR2jX94nvvFE71Kt2WVX9KPxI/EQSwf4sUdFI9Ed12dVZOsN8hXkJSfh386jrG8x1CCxH6Dt5cgBQTfmhfBhfj6rrMHt8ZchFjZkjfK9GiUmUE50Igcf8aZkRdCKliKkVFr+F6pJYE6EGEk8f+WSJL0pC2OjZNAPwPqEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752711741; c=relaxed/simple;
	bh=CS0urUrY3Y9gDj3DWUDYDlVKij5a0JibdpkUY1iaOV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2IeKmDFOD07uoQx0IqO7NE+zS4wL5o6iHTOGAFs0qcDnx5lRFh8KJTgMLDi6NSg3OVM0zjIyKN3D6kHCZlufvh52Gna0pPd8GhJrgOC6zBWlAHNwSUnD4j+uLI9L3PpJuu90ygkUlBPszZLEJ3Nr+sJ5R0twSWDY9vRRE/vaGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=lPaSLKbl; arc=none smtp.client-ip=106.10.241.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="lPaSLKbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752711737; bh=Pm6uvSR6cGTi4JmjTnV4AIy9A7mP6dpEnqMAfr6kl4I=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=lPaSLKblh337AyCQA8KAAIpHjgKrBwlxESasLFJzgMQxBDO3926i62/sG17d5Al4iXNzBiRLjln8wOLMgB6QD0hEVKyELUOpFEbM4iqMN0bYcOALWqhSlDEm3JxBSrvmF7ohYA3WdcTp3fyg3DMseXhFbsRJCZe4HMf8HdRInbCFusEFtv1WaqKx7frqlluNRAax/DbSgdT9SPu+HwVEFb3I2ZDU+mDjGwLSzpLQay6GJiQM9UOvNin/GQSSJjrEEc3bLFBINy6nYWEjIZDTinIcTOR0rFtbalRSnPCG7rncSgXjBO0ZOF4kV1SR9ai0CuscDIcrbIb46sZlPqz1Mg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752711737; bh=trOJ9XgTUrUr7T2PGFtCbFjsytWMhB4Wkm0jZJPTJcK=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=t1CXqMwYjUxkKfCOMn7hBsc4HJSak7zZnVmDF7xf2SFcA4+Ls7+OCtcPSCezYM//l54wIsdkmEo6A32ReKtjj7I+pXI0lZB59g/qCXmtjPXVRnfWiAQCt+wgqe6ruNS5pakmoK4BoLw43ET/bSBtNfhC/JBcLrBaZ0jVqAXYrX5yLAQ4G94cS1QFLx2/gk/WOMsjc2oVvz2POuinq3T20JghaN8adznYbUbfUC1pbD/6naf4tuaQiGjy+W2ZbBJQJKSQVYFBiQol/sNU+03H9s1seXJlYjrXkHnwslEsuiLBxEi/fgun671BcU8uCjqJzt/GML1cyMsfG27uy8jueA==
X-YMail-OSG: xUS1gOsVM1ndvL45pPpR_mnPZpD.eaCadjZntH_Ch1hfmKwp1hZzwZlx5h.pcYb
 QI_FCOV2PjAnLMVrPOZzTi.xWsQgjSte7oCAApcSq0V.9zqDbIcCUrJ1R7NpJISGnacoBKdJT6k2
 mDsjx.ISkYSQglieWG4BOcNsNEwoGaMxrhbGvwIAjVxNfdcyylb2couierwSNczibJsdNyAcdQHa
 YB5VamsFfNhZiXObUsM_5ztgrYTvZBt5BeND.XdUt_S8YsCd2sksAGvTXWyTTkGWW7368fNIvJAI
 or.dbwDFoVh_ykVFrT5MMdG1IMdlckzLbx6gAqE4hCflIcCzacldQ1ic1c8hdxTvRMr3oBRZL85i
 sMd9d8NkOBXmY2UBvDyearA7WBDPzXqSQpBRQxa8A93pn8KlKqR6JmccDHg456OhNHYJVmsL7rtw
 z5r6BQhdJdC2ZsK5jCfM18ZuLMUuz4Xvttswt.hAlNCewUYxc4q202ECM4OlcDdG4.OXuFaDwTlN
 n4TpazTXM.R7u6lIGq8dezRq6g9j8610Gp4MKED6svTAATKtnY.4EPP5PigRuyyBG3k7Iy2U6B_R
 .ArtR9Ad0BliH8noJBL7t1tYJ5lprxIyYof2CGfGup69GsRb3t9YqYZEORwfCKwfBVZVr_eXs6s5
 psjmrGOm0d9iuUTZV3XqMtLC0DO6rCzOmiGB5hS7jucKHxtuuDDYKUuqgGEo6vbiK6wpLYMGUbcP
 RXvkC14PYk0KGZ4BibLeYRqQQiuLu0rHPq6TEpg3YgZcW.AeXROnahiB5pTrSKu3IMlaRtTc67ew
 mcWvuoZKuMmAUWMfuugUA5mjHzW.oJIyBr90T29ds4hR86.BAz2Xa0rjspeLE_aJ0xVqS0NUkzbE
 UxFRBTmhIYVv_28qP65wUL4brO3aiNBzuZO4_i2RiYhczCBQNIdQxCdp96uHSi.eR6SQd2mXgwwr
 e_ZaTm_45QwJ68QiUiCfEtgSXR7QMPpHv178QsVs7EWXdMSAqed3WCmdcO1Q3agYWpE8FfKy4aAs
 Guaoh_ENBv5gs2teSTgxFr4hnmQGzRewjYx0gRuPeYEYIkzU4aCGPOqRcFt96qWPRb0R8L18NDxM
 VdqcxPKLP6WlEl57k.9ViBwDmFuQNlAhgMflvez0fOmmtuiGLT9_pEShIlRb2virtsENaI7K5iHn
 DT3bQ2P8OgoeqmJXufe5juUzmMrPEVGf0GeaXJNwrIZ7l8r3XFsfvj6AYYnRRM7vjiRSLujtTaQe
 veVFYlsBlNW6zzlfY28.mGHubcrmWpEs8yTJ52Ye1iFolV180IY4cAgKbp2XmgyhlzN5TKR6.7kr
 XBywZNA0UGylJcMdJj22aN3b2rAGAKU5f7PBbGFUNa0IjrNE_Pp0Z9tLj2o5y3CEHETnb_YuC0r0
 TllBUEpmkfA_8J.8mQLjHpDCzfir.PQRIXo2I9u0bblR0S7OugFU8OeTzudmkRdCUjmbYzvnVp9w
 c_KztwmY57p0v9m9DZfgG8h3rJGeIxMCyIcqjSfycsnRlkyuv9O25MHZrs5dZidv9GFbnq1JFlvW
 YwiDa1v5OqXFV4Mxewy6aMq8EbkBbdbUP8.AiIwnqHVz7gHYF7i023j03S5MtUiDbMjSlAYvcE31
 wZy7LaPMV.13PHoQDV1O_QFiBtc_DKlgOhDFqVo7vBlf23PN0uUkBYS.TwQikYarwpETqzhiQkqN
 trucYVIzgQKeVzBVrUvWhpqudfnNBAEXdgNb5YpX4eEws3EmWHFQaAOy4_PvcjZIsezDHCjJzwu9
 bvObbiemp7TsEPcw3WVkHYMU2lGjyml9fagYhOv2hwVx.WbwaUwuHWLlVgpM3acOrPC4w4FyXUh8
 1gnwKVwScoawDPNo2eQ1_q3oFh94mC7vDChnzvvHr.Hd7oriGkXSHxX2vlcC0vmQ7DGnmZtbsTnu
 LqcT6JpQwDIPe.vXxI.1ZqogC1BY6bkV8MMEGLBRFYXt7aDwa5H4LJCpWtLJRlzVJuGNrEwh8wo0
 SJOwET5Kradc9.0SsLH2c9mZgCSFbpdBN5HQ5QAkPjDdDlyqzV7T8dZNnFRdgbj.3Ari_4qa97C0
 54Gcf.HE4a5ELj2sRlSOAC34wX29j9Xt16aD_p9PFtbgXE4j3yPXlmk3zugWUpFxDZTmVslDe3ag
 O0fIbAkWxOy5CQoJ6O13A0akFQWeSddj3pTGkSYLFoebAAr6M08HUjrPd3qwymSqTBu7hAxtHZxa
 G9Iw7dREm1TRD7FE7w.bVUJcNMszj2yZFRdcyDQrYS86QdQtZXAMl6z761Revn0kcEy4BANYQHMg
 9HFoVRtx8FhaErWcEVoBZLClBwwO5EdLvKsOA2A2v5Q--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 86ec978a-c595-4df4-bfc7-e6d2468b373f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Thu, 17 Jul 2025 00:22:17 +0000
Received: by hermes--production-ne1-9495dc4d7-mqk7g (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f04af0276389773268c316570c99886b;
          Thu, 17 Jul 2025 00:01:56 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lkp@intel.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	gupt21@gmail.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	stable@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH V2 6.1] HID: mcp2221: Set driver data before I2C adapter add
Date: Wed, 16 Jul 2025 19:01:50 -0500
Message-ID: <20250717000151.183803-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aHgM7XIAzGo8fgwN@32653d2b52f0>
References: <aHgM7XIAzGo8fgwN@32653d2b52f0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit f1228f4d4254dfad837f1a1e4c69930417798047 upstream.

The process of adding an I2C adapter can invoke I2C accesses on that new
adapter (see i2c_detect()).

Ensure we have set the adapter's driver data to avoid null pointer
dereferences in the xfer functions during the adapter add.

This has been noted in the past and the same fix proposed but not
completed. See:
https://lore.kernel.org/lkml/ef597e73-ed71-168e-52af-0d19b03734ac@vigem.de/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
changes in v2:
- No code changes
- Link to v1:https://lore.kernel.org/stable/20250716195316.176786-1-sumanth.gavini@yahoo.com/
- Updated the upstream commit ID in the log
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..9973545c1c4b 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -873,12 +873,12 @@ static int mcp2221_probe(struct hid_device *hdev,
 			"MCP2221 usb-i2c bridge on hidraw%d",
 			((struct hidraw *)hdev->hidraw)->minor);
 
+	i2c_set_adapdata(&mcp->adapter, mcp);
 	ret = i2c_add_adapter(&mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		goto err_i2c;
 	}
-	i2c_set_adapdata(&mcp->adapter, mcp);
 
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
-- 
2.43.0

