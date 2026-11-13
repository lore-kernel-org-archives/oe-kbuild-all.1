Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554331;
	b=SCM5YbMMAFk/UvKBXMZSA5DPY/eTtVOxQC1ZmAStDF9DCjf01ZxhIgNbk81jo1PrksD/
	 cSwoMrueWiUWjN3W5sltFfj5g06phsouQhp5cRa84kfn2yNoglpYNC9KdefzGU7j1ELbg
	 S9oiPs0NY8HXaAdoljuCm2TT2OE5l9035dgxav8nNeccGHACHWcdvFp+bc/9gJMITcvWo
	 dTqKn+NfgZGKgXhM5nhxgwbTk2dnkXMRFI4eH85KPCBlV4xulVdthhLEjW80B38KQojSe
	 4caoN/Aiejh1jCZFA1W1E2rwxKYMdmorSmw/omB1ulE8Gb8+Kj2Mfb4sWns6vVtliyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=CunFNSp2/vDLrfhDOylaPCv63mK4n2/bJ1fZmlHYspM=;
	b=1nZ0h5Xc4PRxutO0pUWq/rTlidiq6IZ7olzGig4JTgq0+83DJRX+JqySdP8v6uu95w8M
	 gg+ytPFCiAT5ekqI9WmP2w2XEy0HFmhroKD1cJi2SuawFbGcI0YCyw95HhUDf/Agmczjl
	 1IclSF3gpYUQmze5/O2DgbQ1A2IG9wawSUThAAKcWFHUIzCJejb6tSjkVIDuLOSs3aeLo
	 tCpySYN3ZyNnias/cUozbJtUEY3m7pZeb2373boRzOy0Pql9yARRGTsegANj1PGJaa3J2
	 uwvoX5xx0fScqn5e2dYpUr7Ab1EIuOrUC9Rca2lC92Jqmfo0AxA9J0tHeyNuRfG3xmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=cryspen-com.20260707.gappssmtp.com header.i=@cryspen-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oa3U0X9o;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7504C606A321
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 07:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7504C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cryspen-com.20260707.gappssmtp.com header.i=@cryspen-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oa3U0X9o
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so8586545e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 23:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryspen-com.20260707.gappssmtp.com; s=20260707; t=1794554330; x=1795159130; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CunFNSp2/vDLrfhDOylaPCv63mK4n2/bJ1fZmlHYspM=;
        b=oa3U0X9oAfwCs+hxT/a+vs2TZPP+tRpSWIL6FLn+jhs0NhLZAg5pbK8tLP6RHAVgvw
         B2hfiYQ46hT1Gz3h04K7vNLFuF6VDrtXm4s7pDJlsHXT5B+WX+nZW+eCfd2bgCeFfQQt
         DoaAvE9DQjTikC9jxlXfc7s3VarjGXPGFsGuOZgwh8s9FTT9xc4xvu3mvp8e19xUPXrJ
         To9iesn97a6zEl9vVv6khrSpG7QI7tIGHsAvMpSTpcQExedvgeOXa6/w4AnAJEmLpUm4
         zFQyqh4Xrt2gyo5TjxcppwaRJZ1mBBSarbBCoOXD7CVC4X0hZrRA9mVpPEXiFCvLCSS4
         1xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554330; x=1795159130;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CunFNSp2/vDLrfhDOylaPCv63mK4n2/bJ1fZmlHYspM=;
        b=xbeOw6Wc3xM1+Iq6QYN41+jHjv6EIVvcyYR2gCLHARQeh8cr/3n1bhC7C3sBxCva87
         zbkBp/grUCygfAv+QudrzsITX0nwntZJSXxC1e0LV6FcAqKrXxlsmrnxfx4NY/Gm0/Lv
         PAohzH6yUprNpeztGpPDNKeWSaf6vblaeThdAarWydS1wxC2E911m+6XvTY3ksA/zIml
         0KbmuhGjjXZ2i7fV89q/kpPIH+vBzxdaHG67HLEAAWwiinP6XeJCmthxsJjgXQFbiCIV
         faAxe3l0Y1gnxFyvOmpCLBCPqaKi05GLY3kZbvVOfKcwUcWF6qUI1HS8iCE87f+FAtaH
         GqRg==
X-Forwarded-Encrypted: i=1; AL+hErESSbXxXOWjfZ+Bs3p2L08ReEnbgs3rsFdnqoVzFgj6LU2dkQsrSJOGp9m83PJpUG7BGI2t/0gTvq/6zrq3@lists.linux.dev
X-Gm-Message-State: APuU4Z8KADDfFSu1rzcyXRa9k48j/PUPNhC0WOVJN6n44zri4OR551/J
	+/7hEGAVdWFZ2/6dsfMIM06bDhBM4w9aWRSqR5uH9PakEvMyJxwIDfch4YjsXHhplgk=
X-Gm-Gg: AYBFou3oX7RjV3uECb66FlapdWRtPVOqCl5xRiavarMiBdNk5N06zqNYM4ivofG50fX
	z8ofkjhCj9x2WNPGCjMoI3gVugMJyLkpbzEVx+RE28GyQtzaOp6gAqnE+eAWhf8P9VrW2zHoRTy
	1fzUor57obqVFH+X8oa1rOHB2KKNcyTCQXSFlJaKwgYm9T8lU9e0qRl4Rz3jOE/PFF+oraXnUo7
	h9563GvdzSvULwqt3NcsGeegpm5vEXskxsaiyLG97NUJ8TqZ3jKsWs0WcynEnyJwiRNuIgny9jg
	uexNsD8aMdtQ/FW6UHSXC4EH/JK8Do2Zjs7NLQFYweUjop12cQzV+CrmncKzTXW8yE/gIaNlOXD
	WS3nR1NHS5uSRgZSboRp7V+FHFfu+yyxKX4b/oXjstW0aS/sxj1sIVW9H4FwbS393VqWUmx5xU+
	GueMEknosVu/pAgI7J9hDzkS+N4dXXcdibK286osl7DIg0YEBDiFDLSX7Uz7qDG4TIbwOyN6xG4
	HNAGcPUxiWCsHEta295vM+lOFTn8/Cmu2QhQKn70OjogpEz8CxkhCrbDd5KlD+MYY8bYxE+KUjo
	0D50O2858dFnrkeQzZ7ICdrG5g==
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr32122805e9.34.1794554329667;
        Thu, 12 Nov 2026 23:18:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm3692391f8f.23.2026.11.12.23.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:18:49 -0800 (PST)
From: Dan Carpenter <dan@cryspen.com>
X-Google-Original-From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Nov 2026 10:18:45 +0300
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 448/448]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1071 amdgpu_is_kicker_fw() warn:
 if statement not indented
Message-ID: <202611122110.Nh7W56Zp-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ec4ee04f96442af315eacc59a21b3381640069ae
commit: e0b33ebf77d967e563a0db05f608fa2313232fe8 [448/448] drm/amdgpu: Add kicker device detection
config: i386-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261112/202611122110.Nh7W56Zp-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611122110.Nh7W56Zp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1071 amdgpu_is_kicker_fw() warn: if statement not indented

vim +1071 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c

e0b33ebf77d967 Frank Min 2025-06-04  1066  bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
e0b33ebf77d967 Frank Min 2025-06-04  1067  {
e0b33ebf77d967 Frank Min 2025-06-04  1068  	int i;
e0b33ebf77d967 Frank Min 2025-06-04  1069  
e0b33ebf77d967 Frank Min 2025-06-04  1070  	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
e0b33ebf77d967 Frank Min 2025-06-04 @1071  		if (adev->pdev->device == kicker_device_list[i].device &&
e0b33ebf77d967 Frank Min 2025-06-04  1072  			adev->pdev->revision == kicker_device_list[i].revision)
e0b33ebf77d967 Frank Min 2025-06-04  1073  		return true;

Missing tab.

e0b33ebf77d967 Frank Min 2025-06-04  1074  	}
e0b33ebf77d967 Frank Min 2025-06-04  1075  
e0b33ebf77d967 Frank Min 2025-06-04  1076  	return false;
e0b33ebf77d967 Frank Min 2025-06-04  1077  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

