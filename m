Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABD19E992
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895286; cv=none; b=VXmSuHoORB8gizb2J9YvaL8rmG0bsI+5vBSVEU5N457Hp+8MC3dx2888M1sD677+10NHxgOVSwQiTHZIh3dsUDxX3AeQlSNxUAxrDaZV1VyP/2cGMk38TzW1T8m2EhtbHfMVGDXPqSjxhzkcDEdF02jqEQQss19PYVfHHaUeAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895286; c=relaxed/simple;
	bh=LnqpvY4u/fhf0uV7krNYGCiNzBsEw+bAuRHQvPggeto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQlAxa/bKITu7K+tC/TWaHzkVrwjTShxYG2j3zg2kvMbVEMStCBgBXhww8Z+7qBB0tTAkUeLixvuW+TRMef/GhXtROsCAESPOj0TgkOmtuo/tbxkQoa3vpcrPLqRlVg3NMA88hR8MXxSx4IIOJ/Py6LuRdrUm0EKDntePXtjQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F12zyACy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F12zyACy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so26711365e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775895283; x=1776500083; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUr/8uvDOk25Bxs96RVGNGmhFOO8HeQm+mn+l9qLV6Y=;
        b=F12zyACyZAYysZrZNRNgJY4/eqORiOOGSWVU8pb06pEl1PQID7Ay/qbkGHvbAOXrjF
         Mia9AKOvbA7RSgKaAuQ5mWTzkzC87gqDnVfxVDUvthpwXJY9E30s1t8HUFOcUxa+ZkmD
         JeI+iKQXuPBKJtUKrc7dkcInrFYWEQa7vf1HAhFWAFGngqiWOY1XQXMT8Xv0yxpDVzvu
         sPjp1I/eenZiwD3BqRQAT8YOzvuBbK8GLPXzVxS3UbP0vFny06JmiCqHPMuv+M+CPfFi
         X6Tx1mtN/If0aqpyiBviV+q2a5cBF8hOtw81jojKWRTRwD0BsjIxvDUk4wByV0Nzfu4S
         DGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895283; x=1776500083;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUr/8uvDOk25Bxs96RVGNGmhFOO8HeQm+mn+l9qLV6Y=;
        b=J8SkyUQdmpFTAdHvzTk1jrY3s8oAWLQFzozRRX+pWKRXuHcWxhflCvKfYvSJ9MuV1S
         7n52gL8GznDtwpL5AprYItDhvZ5Gig9HRX/sQJmsox6hSPGN1jiFVMxnnnPFGyMV7zPC
         FHOXS4tTFEXo8Pn2duPSw+1tfY+LH0G/ahMMl44amQpByfM9tC/VCyFPJPx1G6JYh0rm
         IUPvke7eqYyaKynO1AY8HaGzIRDubAV6JiVq38PYAK9EZOzB9OCe+pAR5Jmo+YVWIcxH
         Q262tjeLZ5nxqB5+3UvemF9gosD7qRlcZSxttIAOn8fXpFIMMPr5LkuhUZJz/AvmMGCm
         T8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnlGOxicOpIMNg2kJZ+SZvylCFg5L5mN9ZVUVlWAjYBDuWp2Bxbl1IJmj6sk5I0gDryPyqbGKkLjOOh2cD@lists.linux.dev
X-Gm-Message-State: AOJu0YzVlkDvwAEtEWX3LzLpC6qEwgWfoWJtkfSW8CUJyCQMrme02/4n
	NxrzERekiJ9qEQP15xO5sP5Pul9d82X/HT4Tf52Z+aZy7a5svlngwVBp
X-Gm-Gg: AeBDievJNYXZqPDjvUer07RuxXyChXYl8rjvhfRuU6KZeD362dFB5Sie3UEZkIzJXhk
	+5mdzd+eaYKQLeC9nFMvX97NIhCxcsjKEYiGgXx3p01WJrpFJfF5zyQ+I9EQ80iEKyNkbiOk9dK
	hldPqE9At5ilz1ylnivDdmAv7xcdHT+OIoksDRnRPK2cL8B816t+jEi6KwvTv9N1m9+WQFdw87U
	763/MCWj2M5qiaux9xvl2j5oIapYze1kG3LURE2cNgWbPl9TSFEFLyKb2hj8B81bGTOqOU/aVAW
	i9fGL1mesXLvGzSVaoe81j3HnEFJQmDwlVYi5bSCq9CYRxJvb3XRKf6N+gnPLZfzNLWHLoLn0zn
	11Luw1VJlQmI7T3fBrSML1IJTBdH8vIRHhxIbXSZ2ztyGoOLk6Sd5e4h5NJ383mPkYTswiK/jV3
	4TvZjggYzWcOvkWm4338M=
X-Received: by 2002:a05:600c:c0da:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488d6864b6cmr65671195e9.23.1775895282861;
        Sat, 11 Apr 2026 01:14:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5344e28sm141633035e9.7.2026.04.11.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:14:41 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:14:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Shuming Fan <shumingf@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/rt1320-sdw.c:1575 rt1320_rae_load() warn: 'rae_fw'
 from request_firmware() not released on lines: 1575.
Message-ID: <202604111548.EL450PMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e774d5f1bc27a85f858bce7688509e866f8e8a4e
commit: 22937af75abb3260c2d563739181f4b61ddac2c1 ASoC: rt1320: support RAE parameters loading
config: i386-randconfig-r073-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111548.EL450PMb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 22937af75abb ("ASoC: rt1320: support RAE parameters loading")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604111548.EL450PMb-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1575 rt1320_rae_load() warn: 'rae_fw' from request_firmware() not released on lines: 1575.

Old smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1491 rt1320_rae_load() warn: should this be 'retry == -1'
sound/soc/codecs/rt1320-sdw.c:1591 rt1320_dspfw_load_code() warn: inconsistent indenting

vim +/rae_fw +1575 sound/soc/codecs/rt1320-sdw.c

22937af75abb32 Shuming Fan 2025-12-16  1426  static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
22937af75abb32 Shuming Fan 2025-12-16  1427  {
22937af75abb32 Shuming Fan 2025-12-16  1428  	struct device *dev = &rt1320->sdw_slave->dev;
22937af75abb32 Shuming Fan 2025-12-16  1429  	static const char func_tag[] = "FUNC";
22937af75abb32 Shuming Fan 2025-12-16  1430  	static const char xu_tag[] = "XU";
22937af75abb32 Shuming Fan 2025-12-16  1431  	const struct firmware *rae_fw = NULL;
22937af75abb32 Shuming Fan 2025-12-16  1432  	unsigned int fw_offset;
22937af75abb32 Shuming Fan 2025-12-16  1433  	unsigned char *fw_data;
22937af75abb32 Shuming Fan 2025-12-16  1434  	unsigned char *param_data;
22937af75abb32 Shuming Fan 2025-12-16  1435  	unsigned int addr, size;
22937af75abb32 Shuming Fan 2025-12-16  1436  	unsigned int func, value;
22937af75abb32 Shuming Fan 2025-12-16  1437  	const char *dmi_vendor, *dmi_product, *dmi_sku;
22937af75abb32 Shuming Fan 2025-12-16  1438  	char vendor[128], product[128], sku[128];
22937af75abb32 Shuming Fan 2025-12-16  1439  	char *ptr_vendor, *ptr_product, *ptr_sku;
22937af75abb32 Shuming Fan 2025-12-16  1440  	char rae_filename[128];
22937af75abb32 Shuming Fan 2025-12-16  1441  	char tag[5];
22937af75abb32 Shuming Fan 2025-12-16  1442  	int ret = 0;
22937af75abb32 Shuming Fan 2025-12-16  1443  	int retry = 200;
22937af75abb32 Shuming Fan 2025-12-16  1444  
22937af75abb32 Shuming Fan 2025-12-16  1445  	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
22937af75abb32 Shuming Fan 2025-12-16  1446  	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
22937af75abb32 Shuming Fan 2025-12-16  1447  	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
22937af75abb32 Shuming Fan 2025-12-16  1448  
22937af75abb32 Shuming Fan 2025-12-16  1449  	if (dmi_vendor && dmi_product && dmi_sku) {
22937af75abb32 Shuming Fan 2025-12-16  1450  		strscpy(vendor, dmi_vendor);
22937af75abb32 Shuming Fan 2025-12-16  1451  		strscpy(product, dmi_product);
22937af75abb32 Shuming Fan 2025-12-16  1452  		strscpy(sku, dmi_sku);
22937af75abb32 Shuming Fan 2025-12-16  1453  		ptr_vendor = &vendor[0];
22937af75abb32 Shuming Fan 2025-12-16  1454  		ptr_product = &product[0];
22937af75abb32 Shuming Fan 2025-12-16  1455  		ptr_sku = &sku[0];
22937af75abb32 Shuming Fan 2025-12-16  1456  		ptr_vendor = strsep(&ptr_vendor, " ");
22937af75abb32 Shuming Fan 2025-12-16  1457  		ptr_product = strsep(&ptr_product, " ");
22937af75abb32 Shuming Fan 2025-12-16  1458  		ptr_sku = strsep(&ptr_sku, " ");
22937af75abb32 Shuming Fan 2025-12-16  1459  
22937af75abb32 Shuming Fan 2025-12-16  1460  		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
22937af75abb32 Shuming Fan 2025-12-16  1461  			vendor, product, sku);
22937af75abb32 Shuming Fan 2025-12-16  1462  
22937af75abb32 Shuming Fan 2025-12-16  1463  		snprintf(rae_filename, sizeof(rae_filename),
22937af75abb32 Shuming Fan 2025-12-16  1464  			 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
22937af75abb32 Shuming Fan 2025-12-16  1465  		dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
22937af75abb32 Shuming Fan 2025-12-16  1466  	} else {
22937af75abb32 Shuming Fan 2025-12-16  1467  		dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1468  		return -EINVAL;
22937af75abb32 Shuming Fan 2025-12-16  1469  	}
22937af75abb32 Shuming Fan 2025-12-16  1470  
22937af75abb32 Shuming Fan 2025-12-16  1471  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan 2025-12-16  1472  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan 2025-12-16  1473  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1474  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1475  
22937af75abb32 Shuming Fan 2025-12-16  1476  	request_firmware(&rae_fw, rae_filename, dev);

Better to write this like:

	ret = request_firmware(&rae_fw, rae_filename, dev);
	if (ret)
		return ret;


22937af75abb32 Shuming Fan 2025-12-16  1477  	if (rae_fw) {

Then you can remove this if statement and pull the code in a tab.

22937af75abb32 Shuming Fan 2025-12-16  1478  
22937af75abb32 Shuming Fan 2025-12-16  1479  		/* RAE CRC clear */
22937af75abb32 Shuming Fan 2025-12-16  1480  		regmap_write(rt1320->regmap, 0xe80b, 0x0f);
22937af75abb32 Shuming Fan 2025-12-16  1481  
22937af75abb32 Shuming Fan 2025-12-16  1482  		/* RAE stop & CRC disable */
22937af75abb32 Shuming Fan 2025-12-16  1483  		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1484  
22937af75abb32 Shuming Fan 2025-12-16  1485  		while (retry--) {
22937af75abb32 Shuming Fan 2025-12-16  1486  			regmap_read(rt1320->regmap, 0xe83f, &value);
22937af75abb32 Shuming Fan 2025-12-16  1487  			if (value & 0x40)
22937af75abb32 Shuming Fan 2025-12-16  1488  				break;
22937af75abb32 Shuming Fan 2025-12-16  1489  			usleep_range(1000, 1100);
22937af75abb32 Shuming Fan 2025-12-16  1490  		}
22937af75abb32 Shuming Fan 2025-12-16  1491  		if (!retry && !(value & 0x40)) {
22937af75abb32 Shuming Fan 2025-12-16  1492  			dev_err(dev, "%s: RAE is not ready to load\n", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1493  			return -ETIMEDOUT;

Need to call release_firmware(rae_fw) before returning.

22937af75abb32 Shuming Fan 2025-12-16  1494  		}
22937af75abb32 Shuming Fan 2025-12-16  1495  
22937af75abb32 Shuming Fan 2025-12-16  1496  		dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
22937af75abb32 Shuming Fan 2025-12-16  1497  		regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan 2025-12-16  1498  		for (fw_offset = 0; fw_offset < rae_fw->size;) {
22937af75abb32 Shuming Fan 2025-12-16  1499  
22937af75abb32 Shuming Fan 2025-12-16  1500  			dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
22937af75abb32 Shuming Fan 2025-12-16  1501  
22937af75abb32 Shuming Fan 2025-12-16  1502  			fw_data = (unsigned char *)&rae_fw->data[fw_offset];
22937af75abb32 Shuming Fan 2025-12-16  1503  
22937af75abb32 Shuming Fan 2025-12-16  1504  			memcpy(tag, fw_data, 4);
22937af75abb32 Shuming Fan 2025-12-16  1505  			tag[4] = '\0';
22937af75abb32 Shuming Fan 2025-12-16  1506  			dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
22937af75abb32 Shuming Fan 2025-12-16  1507  			if (strcmp(tag, xu_tag) == 0) {
22937af75abb32 Shuming Fan 2025-12-16  1508  				dev_dbg(dev, "%s: This is a XU tag", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1509  				memcpy(&addr, (fw_data + 4), 4);
22937af75abb32 Shuming Fan 2025-12-16  1510  				memcpy(&size, (fw_data + 8), 4);
22937af75abb32 Shuming Fan 2025-12-16  1511  				param_data = (unsigned char *)(fw_data + 12);
22937af75abb32 Shuming Fan 2025-12-16  1512  
22937af75abb32 Shuming Fan 2025-12-16  1513  				dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
22937af75abb32 Shuming Fan 2025-12-16  1514  
22937af75abb32 Shuming Fan 2025-12-16  1515  				/*
22937af75abb32 Shuming Fan 2025-12-16  1516  				 * UI register ranges from 0x1000d000 to 0x1000d7ff
22937af75abb32 Shuming Fan 2025-12-16  1517  				 * UI registers should be accessed by tuning tool.
22937af75abb32 Shuming Fan 2025-12-16  1518  				 * So, there registers should be cached.
22937af75abb32 Shuming Fan 2025-12-16  1519  				 */
22937af75abb32 Shuming Fan 2025-12-16  1520  				if (addr <= 0x1000d7ff && addr >= 0x1000d000)
22937af75abb32 Shuming Fan 2025-12-16  1521  					regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan 2025-12-16  1522  
22937af75abb32 Shuming Fan 2025-12-16  1523  				rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
22937af75abb32 Shuming Fan 2025-12-16  1524  
22937af75abb32 Shuming Fan 2025-12-16  1525  				regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan 2025-12-16  1526  
22937af75abb32 Shuming Fan 2025-12-16  1527  				fw_offset += (size + 12);
22937af75abb32 Shuming Fan 2025-12-16  1528  			} else if (strcmp(tag, func_tag) == 0) {
22937af75abb32 Shuming Fan 2025-12-16  1529  				dev_err(dev, "%s: This is a FUNC tag", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1530  
22937af75abb32 Shuming Fan 2025-12-16  1531  				memcpy(&func, (fw_data + 4), 4);
22937af75abb32 Shuming Fan 2025-12-16  1532  				memcpy(&value, (fw_data + 8), 4);
22937af75abb32 Shuming Fan 2025-12-16  1533  
22937af75abb32 Shuming Fan 2025-12-16  1534  				dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
22937af75abb32 Shuming Fan 2025-12-16  1535  				if (func == 1)  //DelayMs
22937af75abb32 Shuming Fan 2025-12-16  1536  					msleep(value);
22937af75abb32 Shuming Fan 2025-12-16  1537  
22937af75abb32 Shuming Fan 2025-12-16  1538  				fw_offset += 12;
22937af75abb32 Shuming Fan 2025-12-16  1539  			} else {
22937af75abb32 Shuming Fan 2025-12-16  1540  				dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1541  				break;
22937af75abb32 Shuming Fan 2025-12-16  1542  			}
22937af75abb32 Shuming Fan 2025-12-16  1543  		}
22937af75abb32 Shuming Fan 2025-12-16  1544  
22937af75abb32 Shuming Fan 2025-12-16  1545  		regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan 2025-12-16  1546  		release_firmware(rae_fw);
22937af75abb32 Shuming Fan 2025-12-16  1547  
22937af75abb32 Shuming Fan 2025-12-16  1548  	} else {
22937af75abb32 Shuming Fan 2025-12-16  1549  		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
22937af75abb32 Shuming Fan 2025-12-16  1550  		ret = -EINVAL;
22937af75abb32 Shuming Fan 2025-12-16  1551  		goto _exit_;

Ugh...  This is a false positive, I thought I had fixed this.

22937af75abb32 Shuming Fan 2025-12-16  1552  	}
22937af75abb32 Shuming Fan 2025-12-16  1553  
22937af75abb32 Shuming Fan 2025-12-16  1554  	/* RAE CRC enable */
22937af75abb32 Shuming Fan 2025-12-16  1555  	regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
22937af75abb32 Shuming Fan 2025-12-16  1556  
22937af75abb32 Shuming Fan 2025-12-16  1557  	/* RAE update */
22937af75abb32 Shuming Fan 2025-12-16  1558  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1559  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
22937af75abb32 Shuming Fan 2025-12-16  1560  
22937af75abb32 Shuming Fan 2025-12-16  1561  	/* RAE run */
22937af75abb32 Shuming Fan 2025-12-16  1562  	regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
22937af75abb32 Shuming Fan 2025-12-16  1563  
22937af75abb32 Shuming Fan 2025-12-16  1564  	regmap_read(rt1320->regmap, 0xe80b, &value);
22937af75abb32 Shuming Fan 2025-12-16  1565  	dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
22937af75abb32 Shuming Fan 2025-12-16  1566  
22937af75abb32 Shuming Fan 2025-12-16  1567  	rt1320->rae_update_done = true;
22937af75abb32 Shuming Fan 2025-12-16  1568  
22937af75abb32 Shuming Fan 2025-12-16  1569  _exit_:
22937af75abb32 Shuming Fan 2025-12-16  1570  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan 2025-12-16  1571  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan 2025-12-16  1572  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
22937af75abb32 Shuming Fan 2025-12-16  1573  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
22937af75abb32 Shuming Fan 2025-12-16  1574  
22937af75abb32 Shuming Fan 2025-12-16 @1575  	return ret;
22937af75abb32 Shuming Fan 2025-12-16  1576  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

