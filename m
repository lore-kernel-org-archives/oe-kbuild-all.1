Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12936BCC9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807468; cv=none; b=nvnqJkJGowTQBVdM4ku2Bh8giSUCDNe4BejZufQYl7ib0AtjUanuOBXYvXcZ7Pj059K8wz6yaj8K3FGqnDN4bU/w/HrnFJkzFHmvDxQd3Velv9+p7Oi3a6cBhc5eLnOdgKVb/FxK6X9XgRHFowM9Ojk3DqNS8dvcXRK1DxrcuNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807468; c=relaxed/simple;
	bh=YkNcQ3NtAJBYnY/PDYgBtDin1rYL1T6RPzvptBiXatI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qco5begnP+QzCFcB2ZowCnaCbxL5C0xHN0wW73LM8Xenq3PIucOAZM3MKOZeuuImF1qtUMb3wiWCbmwocGLeRwpGmYQwUcRtFatbzjMYLwDWb2b/oJf/eus8965741IwpP3uQ+b1kEDI26/UUyGWEmnUOay12cT+MAW3JRROufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSVALg35; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSVALg35"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so51250545e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 02:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770807464; x=1771412264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1f6efIeKsPBmBdsMP945v7o1I22Mg2iVh32MUI/KTBg=;
        b=KSVALg35HhZlG7u8PtyIgqJL1rm2SQdxYEExDGX9IHTBfR26YVJ1MqLUgKzVl898j7
         T0KwSL9IaMTQOAp3bSc/Ujx6z/lc5evbemA+F1gN88kSCMxzmo6vMYFTXgrGRil8y5hH
         daRw9V/9TZwXW2WqUo0ESUb9JI08w5cq1e680+uqszYeqeriS+cbY6mm7Ugj2KLBZSif
         6p694ZTUNNSTJaIK/Zyk+r1nOsuqm7rvhelveOlvao/dzCtlfdqhLVBHOStw8tkFz1Qi
         74eBYln8RRYzE6yrz/skHj7/V6HGUrTlh0sODHRMgI3t+fmOCJCqctDGOw6cjkIWZZpH
         ZPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807464; x=1771412264;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f6efIeKsPBmBdsMP945v7o1I22Mg2iVh32MUI/KTBg=;
        b=dE0t/zunKXgGA8zAp8sAeO36Xsxcs4LLSULXQxtVjdGRy61YlfTIjYEmEPUuz298Q1
         32MffbEn4ue7qAi/oBIIv8Li14VbyUpjG8gQj2W75c/dsD6ALp0qTbws70NXotaKNA98
         ht07Vwed7D6yS/DTyZq9lkncGG0Z6bSiVIIpJJ0qxMWO/+LO4Iws34I6gTfrcTY8NtzO
         qqoziNQSb/jcRYkEb1O1tR/XosmGOdwxLHqiN+HHKZqrNyEONE6nEEgTR2C9trQdZHLz
         fbkLbshIzv36D/vOaDwQl9rzh2Iuu8zumemtNW4AeHj4CDFuZo4IzTIjFV7ynFHgn8Br
         RehQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqirxLxChpBJePyOQNcLWoJdik/Qye1we4vlWPlvtXsVygQYkequNZjKi0xwBfi6ATSrB2Lp3BEr1UnLKM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6pIIkApKDnB1/4/ItQlm9c2W0poO+CAyh8ymOUWt/XAU4VY+k
	4eYrDfCZEy6/hORzqpPp+xDF3TJZvCVnyu707jmtJLtc4RhEd8xbYRJei8pLyUqQUFc=
X-Gm-Gg: AZuq6aKViTUBMuQo1RwIUAqqcIlHUaUCWFBqMzIQpW3AKuI0/e50kjqEEUiMQNyIf3/
	+b7tlR3aVZ+ucfPRyO/7Ndi7yuu6bg58zfKfwh3ZaqmRmrcxG/ykyJ3l7NmvxQLMUxGK0jWTnsr
	Iu/sOR/4VVeVKdqcdulVHipXpc0xPxKZKb3yApzN0T9qEVxtH3a7kAdzufLsjJXi5/Cw/tK6auy
	ItsDUvjD8Bo9rDtxnN1eyjAWPd2URNVPU0f0qy5fEVxFUAe6ru4VQsahK4ydJUSg0Ji1KvZYgyb
	y1VcIoy42cPLpyKjz/pfXLi+MrS9cd803JazkWFeJGvsYM8uK8tDH+lWUYVJBhhgMrNltWrPGZ3
	yZEhBPnQF/rq4XzXFFhm62noN499MT3baR0XRsBsYdAQqRrixwzK725W6HyJQyKIZGKq+T0T0UE
	qcByof4hSytk7cxqn43W+fmhH3KdbXGV+GnYWtxDs=
X-Received: by 2002:a05:600d:17:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-4835dd89039mr20323065e9.8.1770807463537;
        Wed, 11 Feb 2026 02:57:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836131d4d9sm5222705e9.25.2026.02.11.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:57:43 -0800 (PST)
Date: Wed, 11 Feb 2026 13:57:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ethan Ferguson <ethan.ferguson@zetier.com>,
	hirofumi@mail.parknet.co.jp
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: Re: [PATCH 1/2] fat: Add FS_IOC_GETFSLABEL ioctl
Message-ID: <202602111747.QIBXIwpw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210222310.357755-2-ethan.ferguson@zetier.com>

Hi Ethan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Ferguson/fat-Add-FS_IOC_GETFSLABEL-ioctl/20260211-062606
base:   9f2693489ef8558240d9e80bfad103650daed0af
patch link:    https://lore.kernel.org/r/20260210222310.357755-2-ethan.ferguson%40zetier.com
patch subject: [PATCH 1/2] fat: Add FS_IOC_GETFSLABEL ioctl
config: riscv-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111747.QIBXIwpw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602111747.QIBXIwpw-lkp@intel.com/

smatch warnings:
fs/fat/file.c:160 fat_ioctl_get_volume_label() warn: maybe return -EFAULT instead of the bytes remaining?

vim +160 fs/fat/file.c

5fc1746d68b8fb Ethan Ferguson 2026-02-10  156  static int fat_ioctl_get_volume_label(struct inode *inode, char __user *arg)
5fc1746d68b8fb Ethan Ferguson 2026-02-10  157  {
5fc1746d68b8fb Ethan Ferguson 2026-02-10  158  	struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
5fc1746d68b8fb Ethan Ferguson 2026-02-10  159  
5fc1746d68b8fb Ethan Ferguson 2026-02-10 @160  	return copy_to_user(arg, sbi->vol_label, MSDOS_NAME);

This should be:

	if (copy_to_user(arg, sbi->vol_label, MSDOS_NAME))
		return -EFAULT;

	return 0;

5fc1746d68b8fb Ethan Ferguson 2026-02-10  161  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

