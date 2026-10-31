Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454539;
	b=roO2EieKxpHCrO6+ZYdGHWt3F0X5+zlaWX921stN0SQ3yrPk2AhMNVrI4+8NKuUs6Gef
	 iOW3NoBNDM5QOtRWLK1423zEvzxXdQ86o1BEPQH4Sxq4ICvTBW9ZGt/LMcfEhjdRGrmU4
	 UX+9l16rsIHlQyIdorw9rO7UvLrPCg5G0cHAotvysD67yoTd9Wj5U2DRKuntV7QyTLqZS
	 B52knuveqEVlikDNlMyLXnNnME1ELYb/eJPDmTlHdjtw0LqVsnidG8zl5S9+S6lWdNzaU
	 YR+418cK81L28eA03b0fFq14mvpqbdDT8Oh3d9P8Vt0+XgUNBMmrE0y3ikgMe6sL6QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Xx9SCThQoWYYGzLXN5QVW157HMKSdqxGmw557uxzfq0=;
	b=DUxtWLNJFHLhe9Hfn6iWMMCAYMCMcw4czka3zWoSoPPXkzdrdHSiiptmMeqn5iP5+c1L
	 P4B2Gw4tUPwwrR9NtZJD1BTlNtTQJRNfVxS4nJAYAmXsO5r2axsmWK45f7ulzaXScxKdG
	 D/mR76KBSXaHa7c2saNp82298ViJqq7r2CRUZAt/xTLn2XI4u3cRma7pGXYSYQ1uPjUFV
	 aw5eAwFkNgiqWirXRh2hjCCveNh/Dx9BLMvPaYZHnbi+87PWiuyMXLHW6ZJspZZCIMwQH
	 QYNtH2OBgo0GVYXkHcKAEjoeJy4yLvcOjzKU7jUw1dMA7tZeTWhdMQw5sALAJwcPJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVTFYAmj;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 13:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A50B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVTFYAmj
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so14670675e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454538; x=1794059338; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xx9SCThQoWYYGzLXN5QVW157HMKSdqxGmw557uxzfq0=;
        b=jVTFYAmjwFVkRZk+LX+sJxkGCgKiU4pFrXfEO31yWxIXXigQ1CFxSs6bje1ddSxZIY
         Z2nC1WnPrZ79K/MI1w5N+fDTINAGCrAlra5Aj3G48b/5+a7SpmGSGZAGOPN9XroYoDcz
         fyl2KhAMm8gyykTR7k226lMDY9md66WScoankr8O7EpA1MDuF+piDj+9HInFsxT1t/vC
         wUtF2gYomLSIteJJU0GXnrXCcXsx4lIgT3kCwtyR/8m1pYFjCBDH9SpclUh+wvITEL49
         SWsTv9KXIhsmhjF/Y9pHkUFNEKQyr10S+Krrl4CKDOZ3wZ+1yhX8gOts10L7SvI9q018
         JAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454538; x=1794059338;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xx9SCThQoWYYGzLXN5QVW157HMKSdqxGmw557uxzfq0=;
        b=ND8/cvO3cYuuvdV/DkHL5Pa69TUSSmLEvaokNlVhc5KqzaUNSI9XjdvMG9ZaISjW+k
         oK5L3SVVZ5x+iuaTORnVqILoaWO6FMZmNOdgY+aEqWpDgAkxs0xHJRTG/ijqwlJgrFub
         5KNU/NCtQQdeD30gGxqNomiy9YVrJXd6OtOcFxiWge63qdM8y8v5i9ZdfTQ1NEwa4YFS
         WbXyVxbK5a5ZAcjv8+CVnEo1GOc8YCotBKXPEikLxLuxjjw1iQk7r9vwag/hXXzOKgZs
         sxIVCq3xmZz9m5cCoJ4LO/16VbEWJl8h14UitDZeLWuZX8J764st+zd7IoA+8XVQCrC9
         8Cag==
X-Forwarded-Encrypted: i=1; AKwUvBxWGxvEDhHeWlQykyw28XxgS3MLFfIqXGPu86O2RB+lcOrLYZrwK4Eq2kRToIISMY/Srxo9atnHZNb5myb3@lists.linux.dev
X-Gm-Message-State: AFq9FYKab2mM7tiQz2w6WMOfl9X17xzR8UlaVLUPuPIJ/wGo6gPplD7P
	/P0VbEfku9OzQorGpXRZ+zx0Ui/ciLe65T0BHsRgTP2CQsWqRczqajJN
X-Gm-Gg: AYBFou2hKK4x8lXXRxwoRv7iJfTB0gKA3nNEzIQhlIYCvMZk3wA/goi0WSgy73TxP5B
	AXQ5Z0UzMVifv2asmZyqS4/lFZJ3Lxm3Y02nc2uFKFSG1g1/qCXZgB3KUOhBuHbKeoi/tHVCq4I
	TzJCTAzoZREoRVpj0VMySCkAyzAoe2ACSaM/FczWHktDIFmPLryoxjNERy7oLdjFccoCAISBuHq
	3Nzxg+mot61/e6CWqgDfoY8KqAAbuvqCBofzg/oSKvhgLv0dTeUEo+XqHjVfTEuR89OBYC+k0Ww
	tHV18IpakQfkek3NmxhzKzoECDqTFryzIyj/GJlmZO873T72yMSrZCXsSXbRwv63Vds4Ypsl9Jk
	FgxGOQL0YcwygUt+QoE6+CCWwtDu3WVCW9vTzVGAteeOVKdCacETOa3/r+i8T6erLOFrFAH+nd4
	SaNcKxBDVgjGN4UibQplQcTkzKVu7x+8EnU0/y3PiMxdZBmFCD3XQeSKpcTz4uCrkqDgfG8O2ha
	Df7h46n7KhAwgZ7j8ZQ9WSon7Nq/RNZdl2Wtr2Xy0kbvOFWwS3fudsiGR/wPjW0taRBRaGk3fa+
	9dvtt9Euj6qJk+P1n/PImTyk2FRagkWt0eImuFDFajhRQK1pa5Xcw74fpsOXNK1AqMfQYMyOkEz
	6q/jwRMl0vy4tgaR7Td7pe7xRPa8akhpX0du3hgXoLdG3E8A4/1s56+CCmWhOD8IRr+d/SiJgO+
	lLHJ0FsG9WmZ3F
X-Received: by 2002:a05:600c:4e08:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4ac17287d04mr128220335e9.9.1793454537710;
        Sat, 31 Oct 2026 06:48:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm207013265e9.14.2026.10.31.06.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:48:56 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:48:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-30 221/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:884 sn624x_jack_rpm_put() warn: variable
 dereferenced before check 'sn624x' (see line 882)
Message-ID: <202610311423.8OfajSb6-lkp@intel.com>
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

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-30
head:   09f1a103b1f1ef745ade1826d62438261db56245
commit: 29e4cb0a2a9fbfe750da9e9f826e5273b2795f96 [221/343] dai
config: csky-randconfig-r2201-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311423.8OfajSb6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311423.8OfajSb6-lkp@intel.com/

smatch warnings:
sound/soc/codecs/sn624x-sdca-sdw.c:884 sn624x_jack_rpm_put() warn: variable dereferenced before check 'sn624x' (see line 882)

vim +/sn624x +884 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56 Qianghua Wang     2026-09-01  880  static void sn624x_jack_rpm_put(struct sn624x_sdca_priv *sn624x)
12d9c9f8679c56 Qianghua Wang     2026-09-01  881  {
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27 @882  	struct device *dev = snd_soc_component_to_dev(sn624x->component);
                                                                                                      ^^^^^^^^^^^^^^^^^
New dereference

29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  883  
12d9c9f8679c56 Qianghua Wang     2026-09-01 @884  	if (!sn624x || !sn624x->jack_rpm || !sn624x->component)
                                                             ^^^^^^
Old code had a check for NULL.

12d9c9f8679c56 Qianghua Wang     2026-09-01  885  		return;
12d9c9f8679c56 Qianghua Wang     2026-09-01  886  
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  887  	pm_runtime_mark_last_busy(dev);
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  888  	pm_runtime_put_autosuspend(dev);
12d9c9f8679c56 Qianghua Wang     2026-09-01  889  	sn624x->jack_rpm = false;
12d9c9f8679c56 Qianghua Wang     2026-09-01  890  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

