Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8A2989B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774685037; cv=none; b=BchduBQRdVM8CjBiYUtHWKHp504jshtKiG0BwupaUZejosf7sB+7Y5HLOyQO6gJkcDKwiZrpCvt+xvC8kg4fHVCKG4U1TQAYhV99/RoXUK1ht3e4y+FRzfj5/f/RMZ911Wd7CLdUuSZgEqlShnpg4V/OEJ+Ex0QYWct+1O+auOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774685037; c=relaxed/simple;
	bh=NH+hEFS8hz3IE+U1Z5XdJyaeNSgXk9PM8mmULE+qStI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fIx3DwnTfLB5rmL77Rzr4I2dFbOEPjC7T07uzeLTS4Ljt3wSwT+A8XExw8SYZC1uOl5wYL70xe5fqHj2b6Xg2GRgX43uga9EeSVAamUKIhJeKedhKh6x8vHMrfMNftvT3n0G/BMJ9aB6CF2cnP1bA4j+6t22GoPwlFI2rc85FV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaZajXTg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaZajXTg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48538c5956bso27883105e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774685035; x=1775289835; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RljilLjsuRo1BCKXyXXUIO51n5ZE6ILez8/GHw5fO4w=;
        b=PaZajXTgF/a2hDa05hLb/wPaGI+O9d0JVQDLX7/QhY9Po0ZMJtN/cTBcsviBGLynO0
         Xjhu/KjY8+YZOBy7ZgPIDI0G755g/zlU8/CONoolQF8k5Ak5s5mSIFgsjYRSq9UDk91C
         0iUlOBQAZjCsN0h0T/DHiZGuGRh8vInhwW6S6pXfOQGEEyrtnQTLHqxmFiAI8UqQWx1r
         hlJfrsh4HBB2x1mxi0tOzQtsIMXRxNUFwq0yWMnufshRo7e5LKUlClBMr5n2ZhHQtL4o
         YVk1L6wdbC1yQeNjyqhW9LKcVVcH72kQ62ZG/QKdXbexyS2DOd1rnu8L36Rq+PIC0CEo
         hhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774685035; x=1775289835;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RljilLjsuRo1BCKXyXXUIO51n5ZE6ILez8/GHw5fO4w=;
        b=kI08OAchmFGfLcZBjhYpHsw+LZEv1tyoiPX2M7m9VnAxbr4LjR96gv8onVs6oz2xpQ
         o/7YPxfXof9AP63AwG6xiuaVRe44ulrt+atTctSBreB+/ccWCtP+aUTymvzjt7WJVuhz
         GGsn+skM/AYADAWCqTrSRudU/blKzQXYAN1+m5dvwjGgBPj31ExhYAOJgm1/0L+7UeT3
         azi+1RDzXh3l3G0NpKIp45bUfV47WuS/VpgtDnG7UUP9beS2q/6GVpgEOe1kaX/7y/1F
         Eh2CyhJcLdxzzNinOGnQQ9uWEIESzTwgHNM6yfBZjarEMRf1vdlEoqtQxdfue3uCB2e1
         p2MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzoM5BSNAWRsIlZYk4RFW3lmKCxJVHGvuvBBk/JxXucd5VkThH7xqv3teBmWMXZCVV5ARsWoe0q8yvssdT@lists.linux.dev
X-Gm-Message-State: AOJu0YxYS5kHJX0R44xXhWhr9HLvuRAlDxOZNVEqGtA6p3xYcQIzXbfA
	AKjtiHmdIviQNrPowW1zfx1NYScAnVQq2In7e/jdC8qT+mW+BtGGpz8q
X-Gm-Gg: ATEYQzxJNYYz/sVTDtP7D4CjpISeHiEU3pbwP7QGWDoKr6RezfUvVrzPJHH4HSljmW+
	vm/Gi7Ns26T78dkuKs0Lu63Oa8jbl5x8hJAO9MuD61TzfcAIDf1DGoJtYFvGK5n6NUkWvTPzBvS
	b4BEUpEhPk00QQL1kDbZgx3dbhZl66y3a2iO8FaWX4G5nIJon1uYr3d/H73OqVewNnSPgvHcBG1
	G9v44gs1pyBCvyyZK1lnkTkzZEBUR1s3NOFEqh0pokJaA1CECZWT/dWlCwOMmjf4gpOPs9pb+nD
	hTF3Zf0SzSsA+DCtWyaJBoZhRKOMCI/vHA15DuBweTC5WdfJ1/7KVzxMEb7FbJwcisODxYgc3iT
	SSFmY74ToY/e1GKnKJ8E6r4g26LlsMlMS3wQQcjxud55RQ89nIqAdaBnRMtkdoeLHq7/S8tuIw4
	xnASTH+3KFEmsDyhi3gX0=
X-Received: by 2002:a05:600c:792:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-48722bf80d6mr69911705e9.15.1774685034825;
        Sat, 28 Mar 2026 01:03:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e29b1sm3485077f8f.8.2026.03.28.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:03:53 -0700 (PDT)
Date: Sat, 28 Mar 2026 11:03:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mauricio Faria de Oliveira <mfo@igalia.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v1] thermal: core: Address thermal zone removal races
 with resume
Message-ID: <202603280307.P9324SuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12876512.O9o76ZdvQC@rafael.j.wysocki>

Hi Rafael,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-J-Wysocki/thermal-core-Address-thermal-zone-removal-races-with-resume/20260327-222101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/12876512.O9o76ZdvQC%40rafael.j.wysocki
patch subject: [PATCH v1] thermal: core: Address thermal zone removal races with resume
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280307.P9324SuS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280307.P9324SuS-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_core.c:1913 thermal_init() warn: missing error code 'result'

vim +/result +1913 drivers/thermal/thermal_core.c

203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui         2008-01-17  1900  static int __init thermal_init(void)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui         2008-01-17  1901  {
80a26a5c22b90a drivers/thermal/thermal_core.c Zhang Rui         2013-03-26  1902  	int result;
80a26a5c22b90a drivers/thermal/thermal_core.c Zhang Rui         2013-03-26  1903  
755113d7678681 drivers/thermal/thermal_core.c Daniel Lezcano    2024-01-09  1904  	thermal_debug_init();
755113d7678681 drivers/thermal/thermal_core.c Daniel Lezcano    2024-01-09  1905  
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1906  	result = thermal_netlink_init();
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1907  	if (result)
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1908  		goto error;
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1909  
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26  1910  	thermal_wq = alloc_workqueue("thermal_events",
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26  1911  				      WQ_FREEZABLE | WQ_POWER_EFFICIENT | WQ_PERCPU, 0);
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26  1912  	if (!thermal_wq)
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26 @1913  		goto unregister_netlink;

result = -ENOMEM;


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

