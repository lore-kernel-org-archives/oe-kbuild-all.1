Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F8218ACC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607835; cv=none; b=SDhpFVxVZheZhPjkyrHigzqNcBbQwVpfzz/D7g+BKhvDUB9H7aZd7q9BQq4hZavr+PvM+igW4DltQRWMrE6XOE8yISn44YFdN/lKGgbvZ51gW6mpwr6eSwtPjsPM2DDLxhr/lhqJodeMfjQE4oaWBCNsCWMQd0y/19BeXrEToGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607835; c=relaxed/simple;
	bh=PbGYj0RLG7CPYad+Rq+AEDImBjNt5TLUDiyB5JHGqmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SLnEE0UWCRUbAHjVkaTLigEFI0tbh8S9EDuvKcHk/+q50NznO+fCBIc1Of5zeNOBPYI53sa1P4zP9w4LpkV1bpQ9+BQX+hY2wQQZYUox1vz9ivVFXR/A+BZ8eaa0buJvnOpAywXrTrt9tGFrdJ/GPE54M5MT16DBvwXlz4JymOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJKiuQzi; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJKiuQzi"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so5640064f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767607832; x=1768212632; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxNaBeHAJ/4EZ7JTOdnqwOVDyNniPg0HIAmiaHm6nBM=;
        b=TJKiuQziu0ZYEmfWO3aGVYVkpYg3rbOUwfsraBVxnT2uUEUPR+v8VYjPpw+LrRZjgO
         fgK2mZwz7sZZijxuhAxQr9Q9wVoIzPhzYExnZX4A6+2mlou/IID8Y1P70Z0jraICVhDO
         DSbh4ZrjvH1NFZRXUrzLLxLxxovZJjTXkUT8+yBZTEhC75SpfWL3z8Up1tFQ8Mjh/E40
         e0H1atJAiSfsmW2ENDGuiSd7zjsqU+rhEnOFLygF9OtFo4w3YQqa0EZwQ1YPA0bv8rGM
         ayfxtAMnUWpEkwnMBqxd5pReBg5UzXegEoxLzbfLatG9iWAUhapjixyxmbiSkvOaTpaX
         wzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607832; x=1768212632;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxNaBeHAJ/4EZ7JTOdnqwOVDyNniPg0HIAmiaHm6nBM=;
        b=VjEs+cDD6G5GS4mRRO9fW3uzmeocqdFNi5HbrKn+RLSff4lnTcCK0aSokCdXM/QM6Q
         x0OVbBZ7mD54/TQL4yq/+ieHFljySWKB5BhU7Wqn/PoAej5qtqPD6NAsYLYBmr3itv7S
         1hoSQR7tKx+IV7dNEXfKoX16poy7JzzeHqsv4NIRS2LqxS8kBq2QgU1H2xHvLOzCrhYA
         6xr1XBZKR5+ayuijCSshTq9t7kLJAnIVx2yTOZQOw1cKmr2fHQ87tja0cAQ7IRiAflFC
         kSbpQReIyjZ5c490DbT1csRZ+BtvXOsAPOjzniwGKwCL8brk87TQryhDDBfkjdUPU8/h
         /MMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrgl8U7Sxz/jDGAlM+ZgACf1iA7yB0/QkQLtsVfCDhZtqvWoXzVBw+uNSPYCJqsXQtkZi3xPFtItUU0BR6@lists.linux.dev
X-Gm-Message-State: AOJu0YzKmm61X8sRpBq35mrMy8wKmGpiPul04sTttmJyQgTXFAcM9GrW
	3q4WJV+Wshb0HmMsw2Pjzfl/khcyJIsvnMwPV/ozzKtBZ1sXoAcsVw6kVTsHh16ux58=
X-Gm-Gg: AY/fxX5DiIBxb6rAMLYjiG2DpC/3TMUf0O91MkXm4C1TbjF8jPASFO3bRrNQLI5pkV6
	hy7818m/WTnkRkMJH/JcDkynNYAYz/lJHWYusjMhHB2lUjs6MC+/vhRRJ5BUrmjJJdcn4/auaTY
	jzqm3/ZasP2oJOGp+5UGUrlRS1pPpcYRMfAqIEKkRp96czPhR6hJmW0VWVx6qFfStNksS0ZU6qL
	jJhh1hsqDhcl345i5FulVYiRqCLs+pnElVsyLq4fW3O+5HA0Oa92x/VdQZqXI4dGEL10o21KRmM
	I+KLW+QYxFPqeZlFCQo/AYIBLDEiOSvncN4Dr8WMebrnh4/tG3IXTZqYj+w8sVmTJB/gsIO6JIg
	X9V+YvnSQQAobESbJfGlamBLsRNmzHHZoUYcIFTM0hOmYvhEHdayaDTWVkRf1e6S2qLrisOp8J1
	NmcpdAXjNEg3SXUpHe
X-Google-Smtp-Source: AGHT+IFizN6ugrpoj6l/xyTx2wr6ugxEAzpdZgwgMGXWzIHWqKUPqfS+umP15OiFV+l/yYQfDLUJ0w==
X-Received: by 2002:a5d:4a11:0:b0:431:67d:5390 with SMTP id ffacd0b85a97d-4324e50d055mr58872716f8f.54.1767607831963;
        Mon, 05 Jan 2026 02:10:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm100837339f8f.20.2026.01.05.02.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:10:31 -0800 (PST)
Date: Mon, 5 Jan 2026 13:10:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "benoit.masson" <yahoo@perenite.com>,
	jdelvare@suse.com, linux@roeck-us.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <202512300415.VRCQoZYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226203021.27244-1-yahoo@perenite.com>

Hi benoit.masson,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmon-it87-describe-per-chip-temperature-resources/20251227-043108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40perenite.com
patch subject: [PATCH] hwmon: it87: describe per-chip temperature resources
config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/

smatch warnings:
drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced before IS_ERR check 'data' (see line 1691)

vim +/data +1694 drivers/hwmon/it87.c

94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_temp_map(struct device *dev,
94ac7ee616809d Jean Delvare   2010-03-05  1686  				 struct device_attribute *attr, char *buf)
94ac7ee616809d Jean Delvare   2010-03-05  1687  {
94ac7ee616809d Jean Delvare   2010-03-05  1688  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
94ac7ee616809d Jean Delvare   2010-03-05  1689  	struct it87_data *data = it87_update_device(dev);
c962024e306ed5 Guenter Roeck  2015-04-04  1690  	int nr = sensor_attr->index;
542f1e57c17849 benoit.masson  2025-12-26 @1691  	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
                                                                     ^^^^^^^^^^^^^^^^^^
Unchecked dereference

94ac7ee616809d Jean Delvare   2010-03-05  1692  	int map;
94ac7ee616809d Jean Delvare   2010-03-05  1693  
0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694  	if (IS_ERR(data))
                                                                   ^^^^
Checked too late.

0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695  		return PTR_ERR(data);
0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696  
0624d861983c2c Guenter Roeck  2015-04-06  1697  	map = data->pwm_temp_map[nr];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

