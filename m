Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC93451CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767815034; cv=none; b=af0iL8kF6E1U+OyyF+GvUvoWkUKPjJ5OLKIC0/DsIixyPQEQ4rt9WOh5x4PLu86JJz2uLdikyJtRFnYHGriH7wRUDYCtL6sINrAE6lM1yI6DkB22N1cC62MESCNGVLvtMi5qRss+7AP1VeJNhga2U5FAq3hnzQqWQ60KV/XEOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767815034; c=relaxed/simple;
	bh=H4kQ2ImpfCXfEiF09CqkE7nLS72g/BDW/WAuAGSer90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVrF8BnwI6DMiigsmAbMykFMOSEhjjagGYODI/S+RYgrALbJfd5ZIWqyfWva8m1Sja70ijOSA4Tq2y1Ryjep91U29xYMYAauTYc8y6pPjC1wyvAYT8i14qG3jWpZKMzOJYPThbNwkXT1BrGw3ZATSBdcyChZV6bxKOwdfD5WX+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AuSpyynV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AuSpyynV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso11415195e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 Jan 2026 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767815022; x=1768419822; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfhdkkmV7GAX86e2yZLGIC3icQWfc8GaVLQ0woZU3MY=;
        b=AuSpyynV917fOH5olGwPnzTgTU/ouV9DRH2Xww4qFq1t+zjBLICT/iFiE+6TqsosKj
         EesVARtZZhA70vAJDn1TBHN8k940pEz8g6JWcMQdiRIxO3uMzL4gwPKdR1Lglb3rZUVU
         1v8krirrnsRSNsMRZbzTlw3w9sUbf+N2zaT6QZ4MPaK1WV6ZFj5iu2CmLgp7o03fkrmq
         eE752j22rrDMW7vwAeNp/ZkaN89pqO5fF8d2KfV8mwfGy5vKadTdzte2mfwBaqxqWHlY
         7c9FDuk6Zaa6BTa1TrX4VzbyCOh1Z8ugxq0RTDH5VjEMmtMRK0vpMwToW3safQvEP8Mj
         nn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767815022; x=1768419822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfhdkkmV7GAX86e2yZLGIC3icQWfc8GaVLQ0woZU3MY=;
        b=qfaLay3cG865Rp+kYiZzE8hMGc/5cmV1+DZYAkO8hbeKqHLW7ejuU2m69svAL3Fs9i
         8XYzrqHlL4OWq3SY0rhQK5YQaCKBcHUx6wX8dQcSAcwvWVMKjo14WF12kw4bFKoKcE84
         /3CL19Mvv5Yld7NbE4EOKloekK84KgvD/23OIKZvZtEE5JmzJOJtuuzL8LU4EZ6oNIkk
         7RA1k0GgJjWa4nDadkn5TZYq2YF8w3mxnhdXwLrs8n0VhpSj3pCB+PpSFx/DhQr/WcIB
         TN2roOK4PULKFuzazRRjZJ+2c02AqiRd7+9K+9eUsfkxzg08ca4b6tyDRkndInBZyRri
         Tl0g==
X-Forwarded-Encrypted: i=1; AJvYcCVIO9IG0zyaLe0ghzuTkDC+jDyB+jB3ABnj2qBzJD+Aq9Oy9z9GSVyk007rD5TtRkJABnsayfbTSIc0Nnk1@lists.linux.dev
X-Gm-Message-State: AOJu0YzE841mlGTx9qjHwslCoxQuUMbOjn/ixD7c0HUJ+HX+KbVyjTRD
	rpySnJrWbDUJYaPF250ssGAzSTcwDIJMLgXomYyDYMbRrr2gK1mPe9aNx7+tqKUXcOY=
X-Gm-Gg: AY/fxX4OJvUs6p9qiYIfCywwvBMMjWb6+z87jQLyQwOkT4S1wAddlnWysDaP1E6P9WN
	VYpzRPNM0oueV83Kj+/PakdHVDVeqrxWsPmLYySa6fAYLXRCGcP/LyK0QVJPYI9ftCXhd3tlmFE
	j/TtWmSdRi+Dex4wtsR8QNPxlns88SdpB+4P/bdGDK5xCoNYWYhZvAb5c613qdAZxPgncMH+5CO
	7hGDYSkZ9ErWqYytxxFX46Sj0hlqBWJ1q1KNcTCdSTea1WfytNBPiQo1UaHK98BMsQdYwRB2Q6s
	L653k/0l+mC0kXrobyrdZVIlBiWlZODbdt0faKSdWpgjmwunjmZYl7UOjygj4GD0vyHr7d+vcf0
	IIZZ9njDq02D0hYN9R9fnlTO+O8NlDAJBOxTcIstS2i5cNUtb9L8nS4jsReVpqfiNcXuWT6cmPG
	8KhPpMwbzT2E7E/JCI
X-Google-Smtp-Source: AGHT+IF+nx5zCtfYVsKIp8PB8gUjhPK5j02V7HcCtFysVmUTplF5yysifhIl1OB40IVLi4DTO94Aqw==
X-Received: by 2002:a05:600c:1f8f:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-47d8487f5cfmr44268665e9.17.1767815022126;
        Wed, 07 Jan 2026 11:43:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm22141875e9.1.2026.01.07.11.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:43:41 -0800 (PST)
Date: Wed, 7 Jan 2026 22:43:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benoit Masson <yahoo@perenite.com>
Cc: oe-kbuild@lists.linux.dev, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <aV63aitdddpwja7g@stanley.mountain>
References: <20251226203021.27244-1-yahoo@perenite.com>
 <202512300415.VRCQoZYs-lkp@intel.com>
 <CAGHj7OJ=XoSSksz5DbpnP-eB3dQor0zqoXezbYRocFrqj+RTuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGHj7OJ=XoSSksz5DbpnP-eB3dQor0zqoXezbYRocFrqj+RTuQ@mail.gmail.com>

On Wed, Jan 07, 2026 at 08:18:53PM +0100, Benoit Masson wrote:
> On Mon, Jan 5, 2026 at 11:10 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi benoit.masson,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmon-it87-describe-per-chip-temperature-resources/20251227-043108
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> > patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40perenite.com
> > patch subject: [PATCH] hwmon: it87: describe per-chip temperature resources
> > config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced before IS_ERR check 'data' (see line 1691)
> >
> > vim +/data +1694 drivers/hwmon/it87.c
> >
> > 94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_temp_map(struct device *dev,
> > 94ac7ee616809d Jean Delvare   2010-03-05  1686                                   struct device_attribute *attr, char *buf)
> > 94ac7ee616809d Jean Delvare   2010-03-05  1687  {
> > 94ac7ee616809d Jean Delvare   2010-03-05  1688          struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> > 94ac7ee616809d Jean Delvare   2010-03-05  1689          struct it87_data *data = it87_update_device(dev);
> > c962024e306ed5 Guenter Roeck  2015-04-04  1690          int nr = sensor_attr->index;
> > 542f1e57c17849 benoit.masson  2025-12-26 @1691          u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
> >                                                                      ^^^^^^^^^^^^^^^^^^
> > Unchecked dereference
> >
> > 94ac7ee616809d Jean Delvare   2010-03-05  1692          int map;
> > 94ac7ee616809d Jean Delvare   2010-03-05  1693
> > 0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694          if (IS_ERR(data))
> >                                                                    ^^^^
> > Checked too late.
> >
> > 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695                  return PTR_ERR(data);
> > 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696
> > 0624d861983c2c Guenter Roeck  2015-04-06  1697          map = data->pwm_temp_map[nr];
> >
> 
> Hi Dan,
> 
> Indeed I’d move the num_map assignment below the IS_ERR(data)
> 
> Is proposing a new patch V2 below the right appraoch ?

This doesn't seem to have hit linux-next yet, so sending a v2 sounds
good.

regards,
dan carpenter

