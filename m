Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E8E571
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434508; cv=none; b=VhJ24zS7fFEIgmizf7YFyv7xaVG3Jz4CunoXKGyou0+Qm0blUyIdDo5p3KcGqKa4q+YRB3BfXos/GKVI9dLvRLAXNeXaG3p9SpVL00TPSnepwUiZyCJgBAZqnVvAtWQi6bQxdEpp4E38hiA3S7d348BcBMOTJQDcWMLmSSyP9TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434508; c=relaxed/simple;
	bh=8wi8v4pafiCAVW0LlbviwrSq4+RD7ApxtwSAV0zAito=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ny6CJYar3jpneHLnGGpDn0VBUnsaYLGXHm6nYUzuqoMj5xGqVbeNQafTB5j3Gz9/gCXksX6yiExMX7yIJQreoxA/rbGn5cOPie5yUdYVIFhL3GupTl86E+uus7rQJFZjJWfqL4N+q3TXhsdp/SA/tpIwLAqGqIzI857TucxDYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/aGCYY/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/aGCYY/"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b729a941e35so82030666b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Nov 2025 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434504; x=1763039304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enqwyA/A3yCA7Wm2D9J7INIOgAB6+/16vEu7wgpBUcE=;
        b=V/aGCYY/74dhSsIAE2erN91on+nO603tCLpsULyGOjkMerBp9Mb4z7HopfIavZSOUr
         Wha+ZiFvYdZhFAKZsWD1KOn8vcK9bCEmPqUBNV1wIS8hWjAqtdUO/qPIlHaTVZf8DCBB
         Pcxdeq7XwXx9JuMbCfIga8/5X3CeWeoV1NiJCV/WcipuuGXX2isUa/0czezkbKvrRikr
         61G1mAtdN0TJY0UVq0f44VgO6mfhV6TAufVeJZb7vaJ/5gibpsNLIlkyvf5GO7+TpaY6
         lwbf0+3uORzLhPHTk9jDg+e7+uyNgEOM2d+ke9Av7khrIwtydKvmumY15add/rZeEk9+
         fqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434504; x=1763039304;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enqwyA/A3yCA7Wm2D9J7INIOgAB6+/16vEu7wgpBUcE=;
        b=OsG1DVcrhZwt1uUoKc0jgbYLNqIZwj7Yniv9FqnCrYasrfJQVT3Ef2GN6gP5vPbcjh
         kx02LsYjRRaaeXIdanD0Jdy2q6DsVCh4KBwcwmXmMX5zHq/KLWTSk8+wT927rMkOhugK
         ohHccHD2Yc8HX+Xb2nmy8o1o7L0056DwP3xoUhKF4LiGSbH5BLwhd+WbgKnKizKF//s8
         +y3Tl0JKIlwnqNsIvWk/ju9Us2PHm5XXa2pRNmH5BXPyRpl/fMGqfZ7s9FaKh89ObX4o
         29TzilhOuYUkLsKeo9f+aYwSK5dSnSejVCKujoV5dtZtQUuDwm93ooHV6q9O4uHzwFv0
         bxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhco96cJiNPl767Kv0yfPX968XMz5ZMmDpiyiKZ+znXLR8NqSrZ5GtMHSGZymN9S4i21sFUHOiuEKElIOC@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa9fFmarnQZ6LD2f8R66VGLH1Q8idPxFCQtV82RbJY3RDMiwL7
	qV9FNe9TsayFcK4GhqtrqH9PIS+5+QInIBwUITTwO4cR2kmKRZSOWmiogRiM9myA/os=
X-Gm-Gg: ASbGnct9eZzNV1FnJfq+2/K6+hFFTSpsvnhxtvMISziE7xM4fAAzlkAYNXHxv7/+std
	i3kSK5ru9Af8jwsMlemOMe5DptubvgYv5p80vVtsI+xG+0ijYl/LxK5/WF/AIG/A2ToHup9rPjz
	ccNMh6gMolFbw3yr+ZPO2pddLmdR12F+NOzsGHPOcoOYd6xZWmxACilznmAdu2LUisRP778x9by
	Co1SPd/oFU1z9eWyRrcid0vpW9G5xiMqRNjLgqDsP+bhx65jGdvdGQGym4/j6xf6bKBXempx1qN
	6qMlW2gpZz+Cd7Jqr3AgfOB6+pMOeNEeI27s2hF7B8NgOzBXgPFRl3KnDPI4bcp6HR1bmpuqlHF
	m67Imc3Y0OuCLRXcFv61sW1ggT1Krs4uiOCkjYcVHTSFYjH7m5DI1SiQSs6FjkzmjWf+lEf5uhk
	N76dzuJm5xz/cW
X-Google-Smtp-Source: AGHT+IFDbNceai8kygqAPsrd4nZO/xDH+qcQBTNTFiNY8JYz+2UNeSt3srq3B3R4fGOrxSuhtxFg2Q==
X-Received: by 2002:a17:906:c103:b0:b70:7d61:b8a5 with SMTP id a640c23a62f3a-b7265603d1cmr729211766b.62.1762434504394;
        Thu, 06 Nov 2025 05:08:24 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896c8e29sm208344066b.74.2025.11.06.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:08:23 -0800 (PST)
Date: Thu, 6 Nov 2025 16:08:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Francesco Pompo <francescopompo2@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Pompo <francescopompo2@gmail.com>
Subject: Re: [PATCH] efistub/smbios: Add fallback for SMBIOS record lookup
Message-ID: <68a428fd-aad8-4540-a509-d33ba116b5b9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102001411.108385-1-francescopompo2@gmail.com>

Hi Francesco,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Pompo/efistub-smbios-Add-fallback-for-SMBIOS-record-lookup/20251102-081803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251102001411.108385-1-francescopompo2%40gmail.com
patch subject: [PATCH] efistub/smbios: Add fallback for SMBIOS record lookup
config: i386-randconfig-141-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040131.8yGeRa6u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511040131.8yGeRa6u-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/smbios.c:55 verify_ep_int_checksum() error: buffer overflow 'ptr' 5 <= 14

vim +/ptr +55 drivers/firmware/efi/libstub/smbios.c

d45578057224c4 Francesco Pompo 2025-11-02  48  static bool verify_ep_int_checksum(const struct smbios_entry_point *ep)
d45578057224c4 Francesco Pompo 2025-11-02  49  {
d45578057224c4 Francesco Pompo 2025-11-02  50  	const u8 *ptr = (u8 *)&ep->int_anchor;
d45578057224c4 Francesco Pompo 2025-11-02  51  	u8 sum = 0;
d45578057224c4 Francesco Pompo 2025-11-02  52  	int i;
d45578057224c4 Francesco Pompo 2025-11-02  53  
d45578057224c4 Francesco Pompo 2025-11-02  54  	for (i = 0; i < 15; i++)
d45578057224c4 Francesco Pompo 2025-11-02 @55  		sum += ptr[i];

This loop reads across a bunch of struct members.  We would normally
use a struct_group() to say that all the struct members are grouped
together.

d45578057224c4 Francesco Pompo 2025-11-02  56  
d45578057224c4 Francesco Pompo 2025-11-02  57  	return sum == 0;
d45578057224c4 Francesco Pompo 2025-11-02  58  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

