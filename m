Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD43C463
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717600121; cv=none; b=oDDz2uHObsMYbpLUlIK7rvaaIyNXfs5yPMCtcNS6a9/wPLACFzKm0QqKBVhh5sY5yKLM39eJCeI7uWJIvpZo2LFHzXmJ9YtSEpT5/D+8vLYPpe2LMX23r0HSf3rydBvv3uGKYtWDval+UAJ9eSHnUH7c66oYF2t5enLjgIUZkjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717600121; c=relaxed/simple;
	bh=R/9wivTDs3u96sEWdTwIGHy+6uzaOMjnC/KBbTF0rdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJk1sHFjM5J5sG4PkeRxR3DdG7RKBThR055XH0YmTw/usnAwTlspU77Hy5YiZTLhj08wWVi2Kijpa4s1JFSfZ0wSd0efnGbS3LRWahfpyBnGqzd4AJSNQOA37oULKMsGRDSieWSVVHl7u8KtqjTn8w6pKeBrrd3hue6r4fMs5yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q84Iv7A5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q84Iv7A5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42155e7084cso11082985e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Jun 2024 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717600118; x=1718204918; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6erns6P7m66pg24yXk3vygFkTJngHmTZFzrZV+/TSUs=;
        b=Q84Iv7A5OgLSD/iRyV3BNmZiicTj1+K7ofwNlh2b/cbbUl3BsI2+RiJGEcK2mVZsfq
         wByj9BD6KeQlKnL6Hb0QFYZygFItklyUPZfbs+mu0UmyJ5q/KSS1nskejKIDIzFRGmvt
         WnBYl7ZK9N4xx7467AhNf9UFuLP+LuZTGyak5m+epbXqZjRybGgW48kQPVxrUx5Y4CjH
         e6uHkPlOuf0B3N/keDbNX48QRpBACSnycGXwHbByDNls3RQsta8321iuNp7vxLK7sgbi
         fqFbx7UySUfG1uoXXz+KH2Zm+126czL/xP58vPxjXzO8//EU7G+NziEg1fEIteor7MEc
         piIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717600118; x=1718204918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6erns6P7m66pg24yXk3vygFkTJngHmTZFzrZV+/TSUs=;
        b=o7XITb55Vh2ccHMcIYORBhPEX9gvuHA2D8nk5gVBnLALjjXysJRV8Xx3aVc9aw/eeL
         Q25M86Vvqj2ohL21XaU6yzA2KHhiEdFmU61zAto7+s3MG2bodWfn+A8Hv+18+4FSuzLa
         xWeiDBy3HqfSfIxqNm4Ego4ZIGLc1zHTbMuV7Hk9q6vQj22EAVziSyUEWw1Vy9oUs4IC
         0kwzO1n0wLZe7gnMlLiFsfN1o5yE/GLMpBOXEIchxuPfI3kmeAv3VxZ3HOPvRARQxX4P
         hXFemOQOkv1IcncbfzWz1YQITgLdt3mmLDaHYeQRVpszCFIEeIAWs5ggjPH08VBPy6Mi
         lW3g==
X-Forwarded-Encrypted: i=1; AJvYcCWEdrYHyKYxMpA6lZo0SZLS3AS809BAvgkbMj8nJ+Ox9nFHd7w4aSbWPvLgkcFUc4WoyYOJ1yt5iBk87p1yPbcv0BaK5LoZCu1b/pwXEw==
X-Gm-Message-State: AOJu0YxTt5mldrZ5bgooG9sVeWyq5TUXCwnOBHb5gTfFAARBkHTx/Z5x
	79eTTAzdZHr4oEUJIwtyzMkoqgUF1iRJPaN2fqheo3F9cjr9w5qc
X-Google-Smtp-Source: AGHT+IEFu8ys0OL+E2LRlq1NQiHBA4qS5m34VFEk2S56/hrWXMWplj2HkecNf8oldUnJapE8tT/jLg==
X-Received: by 2002:a05:600c:1554:b0:41a:2044:1b3e with SMTP id 5b1f17b1804b1-4215633812fmr22794165e9.32.1717600118154;
        Wed, 05 Jun 2024 08:08:38 -0700 (PDT)
Received: from debian.local (host-92-13-19-4.as13285.net. [92.13.19.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148f91sm26280455e9.30.2024.06.05.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 08:08:37 -0700 (PDT)
Date: Wed, 5 Jun 2024 16:08:34 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <ZmB_cs-7GU-m3GXX@debian.local>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <202406040928.Eu1gRIWv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406040928.Eu1gRIWv-lkp@intel.com>

On Tue, Jun 04, 2024 at 10:02:29AM +0800, kernel test robot wrote:
> Hi Mario,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc2 next-20240603]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-client-Detect-when-ACPI-lid-is-closed-during-initialization/20240529-050440
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20240528210319.1242-1-mario.limonciello%40amd.com
> patch subject: [PATCH v2] drm/client: Detect when ACPI lid is closed during initialization
> config: i386-randconfig-053-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/config)
> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406040928.Eu1gRIWv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_client_match_edp_lid':
> >> drivers/gpu/drm/drm_client_modeset.c:281:(.text+0x221b): undefined reference to `acpi_lid_open'
> 
> 
> vim +281 drivers/gpu/drm/drm_client_modeset.c
> 
>    260	
>    261	static void drm_client_match_edp_lid(struct drm_device *dev,
>    262					     struct drm_connector **connectors,
>    263					     unsigned int connector_count,
>    264					     bool *enabled)
>    265	{
>    266		int i;
>    267	
>    268		for (i = 0; i < connector_count; i++) {
>    269			struct drm_connector *connector = connectors[i];
>    270	
>    271			switch (connector->connector_type) {
>    272			case DRM_MODE_CONNECTOR_LVDS:
>    273			case DRM_MODE_CONNECTOR_eDP:
>    274				if (!enabled[i])
>    275					continue;
>    276				break;
>    277			default:
>    278				continue;
>    279			}
>    280	
>  > 281			if (!acpi_lid_open()) {
>    282				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
>    283					    connector->base.id, connector->name);
>    284				enabled[i] = false;
>    285			}
>    286		}
>    287	}
>    288	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

The failed config has CONFIG_ACPI_BUTTON=m. The build failure can be
fixed with:

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b76438c31761..0271e66f44f8 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -271,11 +271,13 @@ static void drm_client_match_edp_lid(struct drm_device *dev,
                if (connector->connector_type != DRM_MODE_CONNECTOR_eDP || !enabled[i])
                        continue;

+#if defined(CONFIG_ACPI_BUTTON)
                if (!acpi_lid_open()) {
                        drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
                                    connector->base.id, connector->name);
                        enabled[i] = false;
                }
+#endif
        }
 }
