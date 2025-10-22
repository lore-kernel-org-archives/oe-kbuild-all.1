Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC292F49FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116428; cv=none; b=Da4sY24WBGLwh9iNb9tj8LqFl6Ye4yAbAA6qnOHO7DcFWQrgaukFokzzBrOoBen6yiEbjlNQefZ4peDXIC8cLRm7h7HMNGs2gfQMdYp0qXNThrubCrOwk0Jq1jqMUmHEN6Z74yx0DJoc6cYuyTRU8GiCSar0hgfB+bRUwY1ijSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116428; c=relaxed/simple;
	bh=+lkw0gmwYWxNDRxLgRFeHVaT42rdFPC5CN5TNEfZLWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HuF3JvskaorFXjC9y/lcN0Hbzbh+MB2oQnQnfP0ykWYbg41ASsHFdUbOrJVsaV2dMkUv7GGtMR367j4zCkoLyjt1CDqZao+rHqzx4OMilqZkA6+CaGIURkMlIW+CmQWINcog8Gcr7vN2lQ9sBtvocRFzOqu18lFqSTpR9zDapB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTdMPOT/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTdMPOT/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-427007b1fe5so4273851f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761116416; x=1761721216; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qv5bMEGvN9X32946bfYvNIl8D9oMhZpgA7zbomHxa9Y=;
        b=LTdMPOT/mHdYow7m4AAYgZarBsZQlKZuSYHNyrYP67zgDb+0e10R5tLDswDS/1rToQ
         eb+voTPtmySwwC8fj1p+LBdakxneYiUcoQx3lDlFS/ybFSVJiTOjiuPPMOwBFIo3s7BO
         7rm4M0HJ6b6BH9j1TyqZRG6jor1+/6ZbYEQX2BG1tO69vtJgizAJ4KSIbmRp1t691DyZ
         Y1o3wr510LtfvtAbGTYGBOgfl0+6AAj6CZB8TV0LDPygLmYsxIzrc08wJoZVW6OiK00L
         txSFmgEaOfQVrDHDcjejTVS/xfkrVK19HkHxwSo/GNk1g7FlK4xSaM91vi5UKoVZtS4j
         pjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116416; x=1761721216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qv5bMEGvN9X32946bfYvNIl8D9oMhZpgA7zbomHxa9Y=;
        b=o2JzSqlfeAImGgaQute+8l5R6sVglbGlHMKd3xpJRE32yI8o4KtrQbOoK14Ykdx63Q
         CJjJdizF4ZT9nvn2oRgvV6sMsCZ8+qzIaE3qydR++MLpJ13r2smXdOri78GHEbXcp8He
         jkB/kgRntaflZSLcQB3N8H0RsaZ+FxkZn4Opfk7NhQM1WZRFcrPomX+KARDYmdVg3Fpm
         sKX/tfOuPNZWpeJG4J6jo5UOc8LdpNA4ounK35i9BJ1FzC894CeUUH+85E5LDaelFP2J
         fQmS5DTp49Z095i7fryiG6DJy6D4H+BX1+2zkG6l84+wTZUM2yCzKk743fGDdA2rboJ4
         qdwg==
X-Forwarded-Encrypted: i=1; AJvYcCXJE4hTa4engau4e0E6YwRHA/e7ihzHDnAqKAeRM0uTZstyXeLBfL15XuIjZ5QFIPoy0lhayVBwBpE6XBo5@lists.linux.dev
X-Gm-Message-State: AOJu0YzaH7pSj+e3nJTt8BjOHf4M6RnDsYy0xVfkHVZ5nm1G1ovCH143
	NwCb0vAeneI8rx/FgeKNKqHTBtKTve+FaU7rj3t1jy1oyo73LvSLarCmPtQl2G/1+bk=
X-Gm-Gg: ASbGncsOV7h1cqVBfIXnASufjKTKyfceimZWqkMGYZqvK2hPAPzvte7uFblBD/xJ+O1
	hu4+CJGfKj9bWjFFnbZJVk37go6uOIC1YVPEQDIArih2rZpLS7Ia6d030u9xN4IPZzKPR0AMPIp
	fo+aFcT3ojvDQkWUBPn+hCKrsTyk4GteQ/hiB3u37vG/DTc81+qV0QwGIVYxNtcHjnmp3dUV5yj
	QVKcRXv8kKV5XtznXJUOpUVJcC+s5PZZgDJUAxXdEH7GGx6O+Q+/ZnQQJyvM2VeD/y77zZgfXXo
	Ptw5UlVjYoe9BrlzwBEhRhfZMztDI1ruVrA9PdfShOk3/5vUPlLpbeN3I3MOyrg5KQtxpiysQa+
	hjbTRcyFn+w02f/wedWdRvND+Wa88OVUfRWuVsr6d4MPgvykscSXp8kSpyfrchSz4dMD/FfMFaV
	IwwQJQMg==
X-Google-Smtp-Source: AGHT+IF9i76yH8MCk+Tr5Mn1WkODA3/xR31W7KLUDUU/ophtp3akzS53FBIQN5I5N9gZZPPgOgtIdQ==
X-Received: by 2002:a05:6000:2c0e:b0:405:3028:1bce with SMTP id ffacd0b85a97d-42704daed0fmr12707364f8f.32.1761116416304;
        Wed, 22 Oct 2025 00:00:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce3e2sm23652718f8f.47.2025.10.22.00.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:00:15 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:00:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
Message-ID: <202510220056.J4uIVWxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020151402.53013-6-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Remove-pitch-from-struct-drm_client_buffer/20251020-231709
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251020151402.53013-6-tzimmermann%40suse.de
patch subject: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
config: openrisc-randconfig-r072-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220056.J4uIVWxn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510220056.J4uIVWxn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_client.c:185 drm_client_buffer_delete() warn: variable dereferenced before check 'buffer' (see line 182)

vim +/buffer +185 drivers/gpu/drm/drm_client.c

449148a7300b8b Thomas Zimmermann 2025-10-20  180  void drm_client_buffer_delete(struct drm_client_buffer *buffer)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  181  {
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20 @182  	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
                                                                                                        ^^^^^^^^^^
buffer is dereferenced here

82e2a75e5a640c Thomas Zimmermann 2025-10-20  183  	int ret;
82e2a75e5a640c Thomas Zimmermann 2025-10-20  184  
449148a7300b8b Thomas Zimmermann 2025-10-20 @185  	if (!buffer)
                                                            ^^^^^^^
checked too late

449148a7300b8b Thomas Zimmermann 2025-10-20  186  		return;
449148a7300b8b Thomas Zimmermann 2025-10-20  187  
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  188  	drm_gem_vunmap(gem, &buffer->map);
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  189  
82e2a75e5a640c Thomas Zimmermann 2025-10-20  190  	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  191  	if (ret)
82e2a75e5a640c Thomas Zimmermann 2025-10-20  192  		drm_err(buffer->client->dev,
82e2a75e5a640c Thomas Zimmermann 2025-10-20  193  			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  194  
be6ee102341bc4 Emil Velikov      2020-05-15  195  	drm_gem_object_put(buffer->gem);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  196  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  197  	kfree(buffer);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  198  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

