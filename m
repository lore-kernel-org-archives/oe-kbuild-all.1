Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C32853F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504872; cv=none; b=AZ1i+xJrt+IJ6FHsgpbEZ//CukD0h0twch8eQzxKCjjf/t7id6GLXtKdXKhulVJ/RNYTDpvkAGAqfbpRVSErR6d5U6wvJCDeR0H7MeCGjD4LNfJXc2M0dCgebHNggKwm2isbEhk0kRpZYU1xuKsVyXnX2NdmhgAdKrUS4gXFp1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504872; c=relaxed/simple;
	bh=WbEtV0CPIKyH7FQXM3VCsQudJJTxDRA8dDx1E0cAO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gsxq11dsDzoBkuxLM/tQ7eLea/FiA3BeAkS6uScNA7lSDx/+dVOwNTMCNK2PGx6EnxkQRER+s4Eek27eHJFyy+hqhpLyn7k9tyTZ62GVGr0Nl1+6ZV+PiMDp4j3UtVsxRBX1xEZBDtnBxw+GgaLwDeooArtca3g9rVichFkVCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYfVPm7A; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYfVPm7A"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so3738810f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757504867; x=1758109667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wg2Ph+PhoATIteAbw+PWkWD/06VwBl1ynTVTQY5RYgk=;
        b=lYfVPm7Ami7Zd4dpSP1bMYj7j4/HC0u2FLwXZEUf2kmxU7OFFoQs3eO55A7FkGPv+A
         vOdpkmjEeS7O6shVAPcfL0hgK5OlBr065kAevUbPQSXtqebkElLpHJtRDoH/gZ0Is0EB
         9Ff8+Wfc9kgyp5+se4MaPe+Id3rmbPDbD37CNcBXAoz9D328jZjf5k4UrA+xQfEL+JOn
         ma2FHav6DVBykkIxylgRMw2WII1Ms9QZdRG7oU8Lk7weklJh5O8HWX1+iIPFeujHShO+
         yJ3XOMmoAiMO4FY9MdgPlsXd6rR0ZyTY1/RWMLaQro7cKrUObSUBwhqqBf8Gj7Eod3x4
         RULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504867; x=1758109667;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wg2Ph+PhoATIteAbw+PWkWD/06VwBl1ynTVTQY5RYgk=;
        b=pAd8YsCHmWsERfJSRL/c5KNcxEEwipo5dnXdkRpTc+t40VenLwGlhP05KsLxDgUMXn
         8kQm3dMX5Fl9+nffSQBYUAJ3SyoI4Z4DN1oRHm9k38Nkjt0y5Nd4BroxnLEQa2VPzicb
         zLkXQO0q8K2aQf8MlhX32JQO/ObtO0S/LysyGONL8c4D1fkqHAQQ7llS6m5gl6hBheBm
         ey9sZ9pwscdX1fsRkF+0z3f5T+0gvydV6Lv4rfxiGatzQVeUqUm3ztl1ALCPDYPFuLZa
         gfjXzM0Fl4yQwZ8X7JUu7jGmXIiQD+mFJZA59EBON5FppFnMGUPTLLWz49BcCHxg5gPi
         L0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSYDU0+CyQx+73NQi1CKGYv33aM9NKlWOnEeuz6zXt2RM5PNa8LOpgkOdBQbRL2pAW9kYeDqX5Dri8x1is@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu6O/VVB4tgEvnLlNAgjsp5wRqlHd+Z8BZGvxvTzGEox2Ux0Sw
	OU1RiWWVJfpDxWJ6MIic0c13qj8rVQE2qQjPgur3RaGy0DsOzDZJtAD1I4JzJf/tDHs=
X-Gm-Gg: ASbGncubyho+fTEtEVmwdtP6PI+2euzABCO/wWYFgVcJmzcrLr6LLkOW0uYwKDSrPHm
	H3hUw8IzBCxuzVN8IMGKG3zzsPHrTPCIODnNxAh2diT0SRUYmGAzlZhc8WZPfqet071if1I5zqZ
	V4Qm49dZP8n/d2ZLq9SSXV15t4YWKTzaN86WXEQqxBty8d6JD7HplwrE7pVF/inF99L5DeOZVPB
	TGMniIzSoqpe9YYfzUiw6ByCVZD0A16d39ORDpmpxVhufLswoHI1UwijMCNNl4P5cqMPBK5eLB/
	WTlhKvsqoN5vO0dxtqpL2Vz0iH6TIik15XbqcT6zP52uu55PDWjTyYTHe6eeJ61x8VmGD7+RDBF
	SvRDuO1YjeLd4XyzMSvJHAfqmFTU=
X-Google-Smtp-Source: AGHT+IHpMaxaSaJ4cnLK/bK8wa1YrfXhxVJLuuDTkuh1vmaIEZ84Pcyd9YYbH8IfZoLQCxj9xtJuUA==
X-Received: by 2002:adf:b350:0:b0:3e7:41ac:45f8 with SMTP id ffacd0b85a97d-3e741ac4939mr7821201f8f.55.1757504867368;
        Wed, 10 Sep 2025 04:47:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521bfe00sm6893713f8f.5.2025.09.10.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:47:46 -0700 (PDT)
Date: Wed, 10 Sep 2025 14:47:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, GuangFei Luo <luogf2025@163.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	luogf2025@163.com
Subject: Re: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on
 rapid events
Message-ID: <202509101620.yI0HZ5gT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907035154.223983-1-luogf2025@163.com>

Hi GuangFei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GuangFei-Luo/ACPI-battery-prevent-sysfs_add_battery-re-entry-on-rapid-events/20250907-115505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250907035154.223983-1-luogf2025%40163.com
patch subject: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on rapid events
config: x86_64-randconfig-161-20250909 (https://download.01.org/0day-ci/archive/20250910/202509101620.yI0HZ5gT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509101620.yI0HZ5gT-lkp@intel.com/

smatch warnings:
drivers/acpi/battery.c:1046 acpi_battery_update() warn: inconsistent returns '&battery->sysfs_lock'.

vim +1046 drivers/acpi/battery.c

9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1001  static int acpi_battery_update(struct acpi_battery *battery, bool resume)
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1002  {
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1003  	int result = acpi_battery_get_status(battery);
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1004  
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1005  	if (result)
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1006  		return result;
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1007  
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1008  	if (!acpi_battery_present(battery)) {
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1009  		sysfs_remove_battery(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1010  		battery->update_time = 0;
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1011  		return 0;
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1012  	}
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1013  
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1014  	if (resume)
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1015  		return 0;
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1016  
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1017  	if (!battery->update_time) {
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1018  		result = acpi_battery_get_info(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1019  		if (result)
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1020  			return result;
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1021  		acpi_battery_init_alarm(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1022  	}
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1023  
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1024  	result = acpi_battery_get_state(battery);
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1025  	if (result)
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1026  		return result;
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1027  	acpi_battery_quirks(battery);
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1028  
ce5e61beaad5c5a GuangFei Luo            2025-09-07  1029  	mutex_lock(&battery->sysfs_lock);
297d716f6260cc9 Krzysztof Kozlowski     2015-03-12  1030  	if (!battery->bat) {
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1031  		result = sysfs_add_battery(battery);
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1032  		if (result)
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1033  			return result;

mutex_unlock(&battery->sysfs_lock) before returning.

eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1034  	}
ce5e61beaad5c5a GuangFei Luo            2025-09-07  1035  	mutex_unlock(&battery->sysfs_lock);
e0d1f09e311fafa Zhang Rui               2014-05-28  1036  
e0d1f09e311fafa Zhang Rui               2014-05-28  1037  	/*
e0d1f09e311fafa Zhang Rui               2014-05-28  1038  	 * Wakeup the system if battery is critical low
e0d1f09e311fafa Zhang Rui               2014-05-28  1039  	 * or lower than the alarm level
e0d1f09e311fafa Zhang Rui               2014-05-28  1040  	 */
e0d1f09e311fafa Zhang Rui               2014-05-28  1041  	if ((battery->state & ACPI_BATTERY_STATE_CRITICAL) ||
e0d1f09e311fafa Zhang Rui               2014-05-28  1042  	    (test_bit(ACPI_BATTERY_ALARM_PRESENT, &battery->flags) &&
e0d1f09e311fafa Zhang Rui               2014-05-28  1043  	     (battery->capacity_now <= battery->alarm)))
33e4f80ee69b516 Rafael J. Wysocki       2017-06-12  1044  		acpi_pm_wakeup_event(&battery->device->dev);
e0d1f09e311fafa Zhang Rui               2014-05-28  1045  
557d58687dcdee6 Zhang Rui               2010-10-22 @1046  	return result;
4bd35cdb1e2d1a1 Vladimir Lebedev        2007-02-10  1047  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

