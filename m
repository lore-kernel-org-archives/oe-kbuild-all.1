Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64C13C3F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683418; cv=none; b=nujOQIbKltIOfNI/9Y5EPh1iUeVWp5nwlN3duaf9jpOOB1W0VFuRuPzfk71vvS18eqN7NYEWuO3UYDjgfjFEl6WrF4Vs0eH1RtOt6gpswSSlLQor/YIsvYIjtkdYsZ/vodcX3wRn3j1lrn+4v+DKX8JPTP1ksOjMK8jzFWv7aLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683418; c=relaxed/simple;
	bh=XjJ63kwcos7MHsAjYLwMK+Uzag2QYhybqntQ7hHSoN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUE581ExLEK8LXabhN087AdoiFzgCVq4yxt8GY0sAxvWRZVLbwcf5Sf4eApPMSxiiM279EmPdZ8I+02VjtUULxOwRN+9SVIHUiEPXsSoKjvvZ+c0X6ubPZV2TtJXI0N4DjZ55PKq/RDjvwQVDvgH81lJjdvTiiY8y3IrJyJe+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUtOEqdq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUtOEqdq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso3840805e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 22:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746683415; x=1747288215; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcHeJgbKnjxJ5K5DRkNbMCSOEMXDAYtsepXEwY2gwck=;
        b=BUtOEqdqRpB5aRWVjuFW9NPAyUHGMfnu5pcJPZ0D5WukNCxY+93xI4ccunPWW4RMou
         vSNIItbIoV1eRs7A87FfsuzgIWvU+/O+ppcifXRJyNOcC6XtSdxRK6FvUbkvZbNdsdQO
         k4eT+OpkeErvMEoj2Agwc59+XTfdQmCB2jOe931mmeqPRmnflt5TJxOyl71tVfCpJy4W
         XZ/VjvM4C24PwlVQBAYyvoPh6UgmucKXU5oQrcpLmMbVvMTlfElIbY7gGlALTLzkM7L5
         r+f4tw6JJxgdFZYxD7yrHMs1dl1BzioJsv5djaQVGSrp42wqzS1rt75OplNXJu7AJo2O
         XxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746683415; x=1747288215;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcHeJgbKnjxJ5K5DRkNbMCSOEMXDAYtsepXEwY2gwck=;
        b=kk6F72zqUYZGjavD7Y95IC9b4W9T0kkQWOCvnVlDA0lnG9xmSjXzkbHWIkVIiXdkiz
         HsgbBApmJog3jfClgspcUylNDaUcbPJc+1VnyAlPc7CzjIl06TuAkg1+2I9oKLt6c8n1
         FLLbBHms3k/dFXfnq//E0Ag3IBTyx6UPBgDTAc9z+5xb3dbpwZzVKzb/SQ4qZgzb8SVN
         R9/Xl3jJahpu/EzIxBz3R/sNSls5jrcJRidwrPtWBS3R1BM2jXNCCx6uCuskESInIHmc
         8gfXvCK6pHw0Zno0rdKatov8HzAl9Y4EC/dGq81NOTH99RaoUYdJqL9yik/yshuMnoSQ
         qSjg==
X-Forwarded-Encrypted: i=1; AJvYcCVHQ9iO8N5spzMNLRKMsIurTL09Cj+xiwFVRR//zsdvhZXPJ//AKlNsSarvESug1DjfKJdQQm6MwSYoHe6Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzQp2oUpva2OcSva1AcwZ9HDvAUBVKSeRNfo/7KwguNLDaQTG1u
	pXEEMstNNWNzKJp0QlTqfM+PNdb9wVVqhdfOh8aFRxaXghLsu5Fqrc4dEjBG/lM=
X-Gm-Gg: ASbGncvae4EgjWJSgkUhLSYDVUN2jX34JsNrXVDjSIm2p1BB5muV1K7jGTaQMvuoVEW
	Rpy9r/SCcetUlqhdB4g8U0XI2BZNK/tKwxn1zrXmJwYgr1QZiDDqCHS20hVZVPPGVJZra903aEf
	M1le63wfNiO+ExweXYKA8NOZnQ1bhT02L8hrpE6R+LxzUa/7T/RiBHc3sB1Tn7lCc4jk/sgkC4c
	3gVgJm006T1GaQuF9eVKOdcYk/pxixiHeUBzeMgbQXmXqhz87QaijqeW+AY3Y46jspT2JLgWoDa
	i/SF82iaRi9qs+1HDj17gDdScJ0vfotRevAKYfzzwpeWOw==
X-Google-Smtp-Source: AGHT+IG/ffPOSHPvA7Gk9i8hhcQ7yujUQiQdiRR7VNei6dUXA0jV9HvtaIF7yFHclkxLl+64FNu65g==
X-Received: by 2002:a05:600c:154e:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-441d44dd248mr41492605e9.26.1746683414804;
        Wed, 07 May 2025 22:50:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd35fb09sm24121125e9.30.2025.05.07.22.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:50:14 -0700 (PDT)
Date: Thu, 8 May 2025 08:50:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Arvind Yadav <Arvind.Yadav@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 6980/9308]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856
 amdgpu_userq_wait_ioctl() warn: missing error code 'r'
Message-ID: <202505080458.rnV8YfiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 56801cb83c8c95ae23ea576570c75a01c1f07774 [6980/9308] drm/amdgpu: remove DRM_AMDGPU_NAVI3X_USERQ config for UQ
config: loongarch-randconfig-r071-20250502 (https://download.01.org/0day-ci/archive/20250508/202505080458.rnV8YfiY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505080458.rnV8YfiY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856 amdgpu_userq_wait_ioctl() warn: missing error code 'r'

vim +/r +856 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  835  		/* Retrieve syncobj's fence */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  836  		for (i = 0; i < num_syncobj; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  837  			struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  838  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  839  			r = drm_syncobj_find_fence(filp, syncobj_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  840  						   0,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  841  						   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  842  						   &fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  843  			if (r)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  844  				goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  845  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  846  			if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  847  				r = -EINVAL;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  848  				goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  849  			}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  850  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  851  			fences[num_fences++] = fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  852  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  853  
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  854  		waitq = idr_find(&userq_mgr->userq_idr, wait_info->waitq_id);
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  855  		if (!waitq)
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11 @856  			goto free_fences;
                                                                                ^^^^^^^^^^^^^^^^
Set "r = -EINVAL"?

The kbuild-bot normally includes the whole function in the email
but if the function is long then it chops the end off...  I'm
assuming that the warning is correct without seeing the rest of
the function.  :P


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

