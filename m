Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C101E5018
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604294; cv=none; b=pqerpTccP+hmL13wUaPKWYU5F7AIKRGYF4hnrw2aJR7xBrBo72TYlL0sKDud39sntLz6oIqRjr0N7/i7wsw5K3oV/KsBujVv/hgB/ZvZLY1Vc70UBLdbvrHJpWyvWJkIEdAvzxDQSNhRS4JZbTOR1/CytlFq//25vwAgLc1O0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604294; c=relaxed/simple;
	bh=gz8BJzu2wLOW/lZ9Zr0y7lhpnTbMYowrgJMDO8WCKgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OlBa8hb2GYx3UWPirfAVsUpfFb1nNLyy62UqDdkZqBRwu7+Aax2NqdygQOtGzBBzJ30KzCHGSKrYCX4/g4fnVlyD4GhGAYkuQkoLL5mjVLAxgH3/ZLGRKXkJ+4SbZhgerPhuwOCCbsNt6rwj1Wty+0ZLuKVr1qCiQ2sSB/o/KLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxoOeF/5; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxoOeF/5"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-73e650f3c31so24015a34.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752604292; x=1753209092; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QxIp2KPb/X68XS9Rue4+6vDNj1+Lo9Jr1cCgfoMzXtc=;
        b=xxoOeF/5iMaKzrFoTvDk+O0TEaJzbMQH/kBZ4uFDLzhcCKhs/Xp0lZIMIs3GNWUIkh
         qUlXm0C0OLzGnDlJArvB2mQ0rDKhXqlnUNpePtaV4H/PTXOWi1T5thIeL+sokMCdYpZG
         4rRdcYS8x0L47fjLmbL0wnCoHpJwLMUv6NUpsPHKvZ2d5BqmgzCZk53BbbYCcRkj8TYx
         IVH1nvSYbrsrkytnbTOrxXkL49DTYPn4bLcQRB3YsA5BcWTcbXnoDJhZvTutXYjSmD5e
         uE6wnLKsDLIoQhK7s1X3LPDwwH2qYiF8KCCdbdq9XGbCmaKfcIDuuOvwC0yka9flwr3T
         6zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604292; x=1753209092;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxIp2KPb/X68XS9Rue4+6vDNj1+Lo9Jr1cCgfoMzXtc=;
        b=ZSRWwq2u4H5Qgb3NB+hDbPlN/usSbhn/IsBP4PioFUxvUgv0N2Qj+zTutq8RQAgFVS
         1WoeJue2TR4Au2c4BV+YpD0E3nJ35MfwgF9+sGpuGsCcYEbgpAllqMFPDFNCgBW+EDlu
         UtS5LIEegLN2DKGZpRheR3K8C9R7A6sCgpmxkv3vsOwR8ZzBe6UfO6RGPKXSkQpvuUY6
         47HFCdHRHT1q9cQ+t6wr5wsoVzQrI48EGWYBgS1PfAkXwv/iIw0yBwql7RvGAItCb9+P
         3TomPohyAH7TT4JxUA1hmbHtcmQzH7rbbG6urU6Fv5Bs6luKdE+eNreUzQxGccMDBUoL
         WnvA==
X-Forwarded-Encrypted: i=1; AJvYcCUgvqOUn33vVncQQDgUWNW0SQ144LW3lMZRJBJetYbJC66Nb/OO+loa6eCvV+vEW7pztbpHzaEm7oxTXq14@lists.linux.dev
X-Gm-Message-State: AOJu0YzTfNZMTzFnoMvPgKokhuty/jSEyFOHYEtPPtueGNTWZRzoNaJH
	xg3F0weyr+ltrC8uQ3gf0XxI4vCjSLoZugsEeGaAcyVCjEDGcmjHQmAICalifpZuA6Q=
X-Gm-Gg: ASbGncvKgT2r/5eEmuDhaim6peWUUoKFq8Arl3LCDvMtAYgde8xytrSGO+6+XvRvYWo
	rhow2kgfqDoZWnT2RtP4hlNzLOg1W0OKbS2LxyksQZw+I6G2vSrzW26UHehglf+iJQyrHlAbxhJ
	MmFSDVo04Vy6zjg/rkojBPjb1i9u9jeHRnu+2minN0CH8sTVFYqDdzDuU/fl3q0vtB86wkHAsoH
	1bZU3NnrOq94DD/CqizEQOPOaukxWlBnj2GsT6atzjLgC60/zxbqJDZcmD43BwR07cyxrRpI4gO
	KLwIhUvD7f2bprizG6QuOoT9u4lRDlAy0qrCkvAIo2jqSYWSMjsUYk209SIxx44ivRJ1NPxmn6Q
	pIQZLbepTsIxznDfL5fTMUeOLtoEvfQ==
X-Google-Smtp-Source: AGHT+IFW6SsYQowq8nq/SUuRTt5CC6bjZVIFjE5jGxHKdFy26L6Zm+gNV8L7T52XWaKhTcqtA47Y7w==
X-Received: by 2002:a05:6808:190c:b0:41c:4dff:414f with SMTP id 5614622812f47-41cedf8a724mr95726b6e.9.1752604291612;
        Tue, 15 Jul 2025 11:31:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:b8f4:caf6:c9f1:614d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9f1bfb2sm1727397eaf.33.2025.07.15.11.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:31:31 -0700 (PDT)
Date: Tue, 15 Jul 2025 21:31:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 34/40] drivers/accel/ethos/ethos_gem.c:184
 feat_matrix_length() warn: right shifting more than type allows 16 vs 30
Message-ID: <ad676383-9eab-4320-a7d8-7daba1544978@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   f2fd4883d04c3245bc2fdd061078823b49709c68
commit: 9ef4a26117efe591b7044a19e5748ce5b23e1b14 [34/40] ethos: Add validation of initial state
config: x86_64-randconfig-r073-20250714 (https://download.01.org/0day-ci/archive/20250715/202507151211.qVv3eQxO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507151211.qVv3eQxO-lkp@intel.com/

New smatch warnings:
drivers/accel/ethos/ethos_gem.c:184 feat_matrix_length() warn: right shifting more than type allows 16 vs 30

vim +184 drivers/accel/ethos/ethos_gem.c

93463a14b8df63 Rob Herring (Arm  2025-06-24  180) static u64 feat_matrix_length(struct ethos_validated_cmdstream_info *info,
93463a14b8df63 Rob Herring (Arm  2025-06-24  181) 			      struct feat_matrix *fm,
93463a14b8df63 Rob Herring (Arm  2025-06-24  182) 			      u32 x, u32 y, u32 c)
93463a14b8df63 Rob Herring (Arm  2025-06-24  183) {
9ef4a26117efe5 Rob Herring (Arm  2025-07-07 @184) 	int storage = fm->precision >> 30;
                                                                      ^^^^^^^^^^^^^
The warning implies that fm->precision is a u16.

93463a14b8df63 Rob Herring (Arm  2025-06-24  185) 	int tile = 0;
93463a14b8df63 Rob Herring (Arm  2025-06-24  186) 
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  187) 	if (fm->region < 0)
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  188) 		return U64_MAX;
9ef4a26117efe5 Rob Herring (Arm  2025-07-07  189) 
93463a14b8df63 Rob Herring (Arm  2025-06-24  190) 	switch (storage) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  191) 	case 0:
93463a14b8df63 Rob Herring (Arm  2025-06-24  192) 		if (x >= fm->width0 + 1) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

