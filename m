Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF06B15DBBA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316814; cv=none; b=lgiwekFZL3UEpDvXo+xFZ/ku/l2yTclYL6bivXuD8VPhG2BCRuHovj2DVGFDceIjooqXB84wVHRjDaykSu8gzS7ahOmZDSWyQIff9lzAk93UEK1vrg+ZJ/Vx86Cidxm4GJGxahVYXWp5Rd7OXnZGGIIi4wRhEtrxAiNwJE5wu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316814; c=relaxed/simple;
	bh=XWWW83rbAXH/TMH29gNpNbYFia8yDROevjztoSrdyi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V6zO1r032GMZcfL2WULlCS2Wqga+7Yo4hM+VmAOsLzRtqwO7efTXKR6zl29xUapBdBmGJdkq739rIQInCswx3Qoxlh25XA5yRNGuQOwJRqcsdYLPxQmF/PyFticQi5PGdegCoVZ1UpEDPLA5Slr5cGuzX3UmU3KeKA+c2soQL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2SQv/lN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2SQv/lN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so5273481a12.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316811; x=1731921611; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txI650kvavqwu1E5P3JWdoyYqrsr/gXCFqbHgGdVt6g=;
        b=m2SQv/lNpE4EH0f6ZDbvPaGDjFOxL01PvtmGfUaMotxAGIWHZUQlr43NBxrod/6TO/
         rjLyitWXnBSyt/xOsCKVJOI7Zap4xiLxiha2bc2vXuIbZ9+EGOH6R97fPM1+t4OU+pN2
         YqT3izxmNy7TEQSVLYAoN0ewHzGTv7CmDAn7NEYKFDhHuvVWg7F4N2eo7yAyX+SZbZDv
         7gyjwZkxBPdo62zRICf/y4ejxuMAUa/V295Ea4bTyLc/PlNu2ob1clWGP00cYcB93rO5
         GpgDB1W8yjs3doSIv+9M7XsuxSrhAf+KULJ4nhfBjXWaORKJMragfQWJ/TlaPORLHL1j
         igKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316811; x=1731921611;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txI650kvavqwu1E5P3JWdoyYqrsr/gXCFqbHgGdVt6g=;
        b=Fz4INk4UhWZaYG/ZNRazEi73Kgtt/vBolRWSxaSxRpkfyyW+99gYhY+OBQz6Yn+k0o
         WtdHlFtvnZagDLf0e+Hel3XBVmf4nBQT4JUxFZPMvXFZL4MfMRRaPVLk7IXvwtDXvU8s
         nyPhum7aiVOZqRWiCcJkgS+Ruj/hkaBbEjaL75+LB0oydpEBx639P87MzT9DhbjZ0GRA
         gBJSloNZLUM9qR6KHUu6rOmzPijRMefX6mV3MFryV6H2PI09HSIlF+riMvtIoHkq8wPA
         Gz8rF31WnJWJAdRlijoM/C1HrcK8sjuDFm6rJkGTrui5lVs7o5VjmHCiPpZSCiqzkZKU
         sPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQTT+ie5VUQRMhAtbb2Mff1w41bsvUH0+yIc5VsR/zdFaTag6aaz7H9yuRfoHu3hBsHApqM5v4k9slpsmt@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2hGD7ENUaD3ejJrqnMesqmNlWAk7kncMrVDzQ876CcLKmFRJi
	xULLGAbHrTVAkJpwCoaJTibtvLkn0Z4KWplXYBVfEb28ClWox77Bccn0kXSQCkE=
X-Google-Smtp-Source: AGHT+IFnvt80oF+INr79ZSij3OyDfBtMUb78u/qtYn+ivS8iT8NgXfFD676hs7vHEI/HME/x2c+0rA==
X-Received: by 2002:a50:8ad4:0:b0:5cf:f2c:384f with SMTP id 4fb4d7f45d1cf-5cf0f2c38e2mr6704079a12.1.1731316811055;
        Mon, 11 Nov 2024 01:20:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb765asm4755367a12.48.2024.11.11.01.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:20:10 -0800 (PST)
Date: Mon, 11 Nov 2024 12:20:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Geoffrey D. Bennett" <g@b4.vu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: sound/usb/mixer_scarlett2.c:4972
 scarlett2_ioctl_select_flash_segment() warn: potential spectre issue
 'private->flash_segment_nums' [r] (local cap)
Message-ID: <acf8826e-d236-4759-bd5c-e81de992b006@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de2f378f2b771b39594c04695feee86476743a69
commit: 6a7508e64ee3e8320c886020bcdcd70f7fcbff2c ALSA: scarlett2: Add ioctl commands to erase flash segments
date:   11 months ago
config: x86_64-randconfig-161-20241110 (https://download.01.org/0day-ci/archive/20241110/202411101058.RkdgFPCg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411101058.RkdgFPCg-lkp@intel.com/

smatch warnings:
sound/usb/mixer_scarlett2.c:4972 scarlett2_ioctl_select_flash_segment() warn: potential spectre issue 'private->flash_segment_nums' [r] (local cap)
sound/usb/mixer_scarlett2.c:4973 scarlett2_ioctl_select_flash_segment() warn: possible spectre second half.  'segment_num'

vim +4972 sound/usb/mixer_scarlett2.c

6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4957  /* Select a flash segment for erasing (and possibly writing to) */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4958  static int scarlett2_ioctl_select_flash_segment(
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4959  	struct usb_mixer_interface *mixer,
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4960  	unsigned long arg)
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4961  {
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4962  	struct scarlett2_data *private = mixer->private_data;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4963  	int segment_id, segment_num;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4964  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4965  	if (get_user(segment_id, (int __user *)arg))
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4966  		return -EFAULT;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4967  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4968  	/* Check the segment ID and segment number */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4969  	if (segment_id < 0 || segment_id >= SCARLETT2_SEGMENT_ID_COUNT)
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4970  		return -EINVAL;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4971  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20 @4972  	segment_num = private->flash_segment_nums[segment_id];

I suspect this does need an array_index_nospec().

6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20 @4973  	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4974  	    segment_num > SCARLETT2_SEGMENT_NUM_MAX) {
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4975  		usb_audio_err(mixer->chip,
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4976  			      "%s: invalid segment number %d\n",
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4977  			      __func__, segment_id);
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4978  		return -EFAULT;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4979  	}
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4980  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4981  	/* If erasing, wait for it to complete */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4982  	if (private->flash_write_state == SCARLETT2_FLASH_WRITE_STATE_ERASING) {
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4983  		int err = scarlett2_wait_for_erase(mixer);
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4984  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4985  		if (err < 0)
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4986  			return err;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4987  	}
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4988  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4989  	/* Save the selected segment ID and set the state to SELECTED */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4990  	private->selected_flash_segment_id = segment_id;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4991  	private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_SELECTED;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4992  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4993  	return 0;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4994  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

