Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BD146A68
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739347744; cv=none; b=sA1W21MZGtThEFO67/vXRIWrRK/7X3rnVNf0gMP+aM1vh9R5li1DxyAIuit4pLyv63VqhpO4R1eU+EGZp+2Uu46dWbiTXZjUOeJiK4Jv8wNNYzAQ5FZ96X0yepBBxLHJRK3qU+XKWuSS303nF8tGQz1gOy04uhQPvRtyVPaG+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739347744; c=relaxed/simple;
	bh=rjOC+UiSQ/hRzNP0qBAggpvoEOd3B3KotYeOYhvh5kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ePKWeCCB28FyBfHa33hOBo3rs5ql1RYKgLX+1TIOUB4L37w8PM/zEECgk/DUb2JqBUpkyilGphA04mu1KKFgmjfKr2lLAK/l616TkfDo54wyO7Iu7+5Y+V9VwGKEH2MCRebRG8PGQZluE9O8kkADRx6rjF7HehLDoNjh7SR747w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtVW+CNb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtVW+CNb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso9656477a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739347740; x=1739952540; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvXcYW1MKztDl/tRYElqJoXD5IkRoH7LOQ+vHwT06FQ=;
        b=RtVW+CNbHCoUdLqRO1Rvd+8xe/aXVgPeGM46ilyBvnfLf7gv4mWcjVIcb9O+Egu2AF
         keyt5jxPo/nvLI+v8SPQdm4a2ItCKjBLsIgOrbVnElXZsxb59hmrE+P1vXp2M6Lcce8a
         J0Ca4gmzKwzdzVqLQ7HtdZpEaJnM7dJd+RMz1vK+3d98SyTgytAzNCApaO2pHRVV0SkN
         zm9fT53D6yWVpyipfEPI5DMmZqG/lUw1nkRD3zW6P01Y1SdTU9wRST8aZoi1etfLkHxY
         caQZgfaJad3NrFHrqul2753EzYKginMs+hev28py4j0AKK0rdyovdxwWmkh+542HNUmS
         0Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739347740; x=1739952540;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvXcYW1MKztDl/tRYElqJoXD5IkRoH7LOQ+vHwT06FQ=;
        b=pyXFQPIGvYbTfGgWr1mhlmpOBqOW/G0EQsWB+pTZ2caQgzw5WLb8cuu6Cj/seuFxXb
         8SEeo2XzEXrdUmK8al3UV2iRZ5WihU8aBBcN0jo5Ac2JzC2bxKn4RSY55qB9qfZmMQtT
         F7bVn9cJ4ooauD31DH/mf5lV8Igk6he7imfuZPTPKIUYp3PzAEKg/mTKGGaHIFF8YJRO
         4EIjcpbFpZTijk7EM53wrUjBe7QZaG91H4CvAcAfxDsgi4Z2jrSX3gctUxhL0xuSBTK7
         IdzTfJp13wsCcmB4/IQpa5PfbG2KToCgWapYujNw9lM7mDv2t010Fjs96b3OtJk7e9Ju
         sHUw==
X-Forwarded-Encrypted: i=1; AJvYcCUTXLuSsJK2/f3JqVwz2Zwv6lBfqUOPQGQf9r8+l4JEGVw66y8LF7dvuzT6mMxZvZA/YB8Tr2PMtpKkeqo8@lists.linux.dev
X-Gm-Message-State: AOJu0YzVoygJvFUR4Jfn9LP4VpGfsoEwvpf/nRrlycfSH7A+QhBAPld9
	6jBi50HMyRq5Kk2bqkexxy595IJZP0aiLJKQh6Lhx7fPUQ5EfxyupmUn7TIFnXo=
X-Gm-Gg: ASbGncttbX/mnmp7K9uQ92xzJW9wiR5TMe/nvwJB6ph8xA//lcfNTSnUlRhn+urdJjl
	kkM3I+ScCj/x7uT4YYQM9QK/56CwBF7X0gTAi7fP/DK7u0oylPy5RW7mLAMcbGueR6kblo6TiFv
	gGTveWGXckCa+oE4XwN3yhZNUetxgpsyOgQLJYIm6xnCkhRdO7HrO9xbzvkghfmmHNhG9AU3vT8
	HhgNS5KStJlyPIaSG9xcXytoRZScWmjcpHdjxnryYqjDGsjEwdSzh8PywvljM3lhOwx/OfvVp7l
	9Da2Gw06F7lZozPsnYl/
X-Google-Smtp-Source: AGHT+IFbvgL16Ql7hM3shlk1MJkm5T6QdHnfS2u0kU96lZQKTswY5nVLhhE0KAeP0UU4pKwvyLBkYA==
X-Received: by 2002:a05:6402:26d3:b0:5db:f423:19c5 with SMTP id 4fb4d7f45d1cf-5deadd7b8c3mr1650639a12.5.1739347740274;
        Wed, 12 Feb 2025 00:09:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de45a92fa7sm10133870a12.23.2025.02.12.00.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 00:08:59 -0800 (PST)
Date: Wed, 12 Feb 2025 11:08:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Melissa Wen <mwen@igalia.com>,
	harry.wentland@amd.com, sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
	christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
	simona@ffwll.ch, alex.hung@amd.com, mario.limonciello@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH] drm/amd/display: restore edid reading from a given i2c
 adapter
Message-ID: <63cd70b2-895c-4475-b154-cf4e041e43d6@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209225843.7412-1-mwen@igalia.com>

Hi Melissa,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-restore-edid-reading-from-a-given-i2c-adapter/20250210-070016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250209225843.7412-1-mwen%40igalia.com
patch subject: [PATCH] drm/amd/display: restore edid reading from a given i2c adapter
config: x86_64-randconfig-161-20250211 (https://download.01.org/0day-ci/archive/20250212/202502121000.EBCEdoo9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502121000.EBCEdoo9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7201 amdgpu_dm_connector_funcs_force() warn: variable dereferenced before check 'dc_link' (see line 7187)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:12110 parse_edid_displayid_vrr() warn: variable dereferenced before check 'edid_ext' (see line 12106)

vim +/dc_link +7201 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

dae343b343ff741 Arnd Bergmann 2023-05-01  7179  static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
0ba4a784a14592a Alex Hung     2023-04-05  7180  {
0ba4a784a14592a Alex Hung     2023-04-05  7181  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
0ba4a784a14592a Alex Hung     2023-04-05  7182  	struct dc_link *dc_link = aconnector->dc_link;
0ba4a784a14592a Alex Hung     2023-04-05  7183  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
48edb2a4256eedf Melissa Wen   2024-09-27  7184  	const struct drm_edid *drm_edid;
be1aae525741575 Melissa Wen   2025-02-09  7185  	struct i2c_adapter *ddc;
0ba4a784a14592a Alex Hung     2023-04-05  7186  
be1aae525741575 Melissa Wen   2025-02-09 @7187  	if (dc_link->aux_mode)
                                                            ^^^^^^^^^^^^^^^^^
Unchecked dereference

be1aae525741575 Melissa Wen   2025-02-09  7188  		ddc = &aconnector->dm_dp_aux.aux.ddc;
be1aae525741575 Melissa Wen   2025-02-09  7189  	else
be1aae525741575 Melissa Wen   2025-02-09  7190  		ddc = &aconnector->i2c->base;
be1aae525741575 Melissa Wen   2025-02-09  7191  
be1aae525741575 Melissa Wen   2025-02-09  7192  	drm_edid = drm_edid_read_ddc(connector, ddc);
48edb2a4256eedf Melissa Wen   2024-09-27  7193  	drm_edid_connector_update(connector, drm_edid);
48edb2a4256eedf Melissa Wen   2024-09-27  7194  	if (!drm_edid) {
0e859faf8670a78 Alex Hung     2023-08-25  7195  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
0ba4a784a14592a Alex Hung     2023-04-05  7196  		return;
0e859faf8670a78 Alex Hung     2023-08-25  7197  	}
0ba4a784a14592a Alex Hung     2023-04-05  7198  
48edb2a4256eedf Melissa Wen   2024-09-27  7199  	aconnector->drm_edid = drm_edid;
0ba4a784a14592a Alex Hung     2023-04-05  7200  	/* Update emulated (virtual) sink's EDID */
0ba4a784a14592a Alex Hung     2023-04-05 @7201  	if (dc_em_sink && dc_link) {
                                                                          ^^^^^^^
This code assumes dc_link can be NULL

48edb2a4256eedf Melissa Wen   2024-09-27  7202  		// FIXME: Get rid of drm_edid_raw()
48edb2a4256eedf Melissa Wen   2024-09-27  7203  		const struct edid *edid = drm_edid_raw(drm_edid);
48edb2a4256eedf Melissa Wen   2024-09-27  7204  
0ba4a784a14592a Alex Hung     2023-04-05  7205  		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
48edb2a4256eedf Melissa Wen   2024-09-27  7206  		memmove(dc_em_sink->dc_edid.raw_edid, edid,
48edb2a4256eedf Melissa Wen   2024-09-27  7207  			(edid->extensions + 1) * EDID_LENGTH);
0ba4a784a14592a Alex Hung     2023-04-05  7208  		dm_helpers_parse_edid_caps(
0ba4a784a14592a Alex Hung     2023-04-05  7209  			dc_link,
0ba4a784a14592a Alex Hung     2023-04-05  7210  			&dc_em_sink->dc_edid,
0ba4a784a14592a Alex Hung     2023-04-05  7211  			&dc_em_sink->edid_caps);
0ba4a784a14592a Alex Hung     2023-04-05  7212  	}
0ba4a784a14592a Alex Hung     2023-04-05  7213  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

