Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625A27EFE9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768736432; cv=none; b=BfILkp7YUCBP1ofFtP2pQ2IUjegTBRr++O6GR+a66NvqR+W3dr/0wNKRSA0bLcbojPi5/Mm4HRQA+ZzlMm5Ci2Q8s8iNWGk3BBMf1UFJcBHneqQPX0i/Wjve5yzIbxSQCsxLYKJ8ZV0qnJJJt17zC6q0JKEQLmVqf+OpQoxwZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768736432; c=relaxed/simple;
	bh=pOA6yYwWO/dRzMbot7xm/t7739T9LoBz9afHo9ejfHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KSXi8oCPJAIZo6WG8gNszQ3Uj1KYnetIAxl/cfc2Tryq15nmL/4aSn5gwxPclAmk0wWKUkZJxRdbIau5RjjVNOAk+n4dDWa3xVMOBGsXQIptGmB2iK96yAJb5QRZ6Qbdc5lTz4+XeTGUdoQeIa+VEIK9l5Z3A/E3zFrqmcVrTWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sji9qI5I; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sji9qI5I"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso28489745e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 03:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768736428; x=1769341228; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0TfTHc9zDG9GUP+EmmkZTp99QxQuPid9lqNmwi7kJk=;
        b=sji9qI5IhyTjQovCukKIOWqkqvL/AaAn8Sh5Q3hgtZG64q8kcNSeuNK5MAeBmoF7Yx
         WK3AykxEZrOUVLAXXOSJY9zxm+BPU+XFTOagm8ePM+K67VnKjDWtkyRwJwJByLoYLaDC
         PhrodELtzuBbphJzXLdEYVGUyxGTjtTWitIm8eDiijE7g8C4/q+P8qxKXjAKzAX913do
         OT7Sz50FtMo8xQFc2eglksu6cRiSHDM5DEbOmn6thYvOjAaJYODVDpU2spZxyqBg02na
         l2sSgTvy/Dj2hVSnqF8T1KyqBji3aqZIuFg4enWJVmEB0+uhWbmvvZKMjdIiaYpks5Qh
         8ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768736428; x=1769341228;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0TfTHc9zDG9GUP+EmmkZTp99QxQuPid9lqNmwi7kJk=;
        b=blNh2Pdi46UYM/exW0DLjjFLBlISy6vXIfBz0ct/dRv6OrBQAPTnmZmfV6TyeqoExv
         YkUs6376PWeG4SlSlzKPiwjti5ZSVvWprvwf8kEDYJ0TA3xNl1hHtHSJ63TKyIkInsO7
         SzPeB8VbzI9dfIaNwpJu4LxQOB+Oov/wLfXA0gvnb30JQvn+Fa84OQjn3I4crPloLWAa
         pSzcExsCyhgehlYoFt5Ky5lEPxRPKAEXA+eXfk8PD20WgmcTV/reuG8SOjxx02vado8h
         2aJt3J6YopJJbdu6WZL4x5yb7/dlgz2LJfHi2ks5qmMLHCxVrQcwAgvXvr8TymIkBt6M
         wGyw==
X-Forwarded-Encrypted: i=1; AJvYcCWSB0zzcpb5W43oUSnKlg8Kcu/HX2lHCQ9DZAtGDOs0RzS0hCX3f9DTmjqj301PfNtkSPnbXpDVr2M2NvP1@lists.linux.dev
X-Gm-Message-State: AOJu0YzYHC0/tLEzd1EL/V+1yHINfFvieCVAIwNG936xBBOWLCk5yiFU
	iCiLbUDJpD7xfVhw/m34TCj+xVjcA7OoA+FIXK4lWTucBPasKIKK8jFWPOpLnWzPfgc=
X-Gm-Gg: AY/fxX6YWjeCLnK1ZnBKwiRLtdFEo3lMR87B223kM3LYjV+3Rf2xRiicQs49kTvde7B
	LGJeGVoT1EHKyisdHZeVdLRxFVugdCX2aHLmlbv8HMN0lQv+rDXE1rMTw6VpnpF8DpHCf3kz3tX
	PZck1djc3/Fkb+dMGO51Fd5cXPNiib4JVwz3GmNDrHXdACHlgKdABVeR/7+L16HuVM6zcmF3OF+
	cgPvx7vd6JF6JFWTCwyW1NmWQPrOZ8MGZ9QL/Ie3PEWgpVFUvYnMMWoeT6qYnnyOwn6zDdwL2rr
	iUxluV7PjXiOC+AYYBKGspVV208GfH5qpZod/NkHaXnOnG1THnN5EHX11G9nkdVvNLnqB5U5zL4
	ZCS8EGbngGolp547tKsM8Ydr1zgDFoeFL6lPOKjv82ERB46PoyXxZs7UT8SQr2yW5S8LHIGiS/d
	1hnhezuPVv05gD07pr
X-Received: by 2002:a05:600c:548d:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-4801e2a4c3bmr104805075e9.0.1768736428260;
        Sun, 18 Jan 2026 03:40:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm167559335e9.10.2026.01.18.03.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:40:27 -0800 (PST)
Date: Sun, 18 Jan 2026 14:40:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shenghao Yang <me@shenghaoyang.info>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ruben Wauters <rubenru09@aol.com>
Subject: [linux-next:master 5767/6121] drivers/gpu/drm/gud/gud_pipe.c:616
 gud_plane_atomic_update() error: we previously assumed 'crtc' could be null
 (see line 597)
Message-ID: <202601142159.0v8ilfVs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: dc2d5ddb193e363187bae2ad358245642d2721fb [5767/6121] drm/gud: fix NULL fb and crtc dereferences on USB disconnect
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142159.0v8ilfVs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/gud/gud_pipe.c:616 gud_plane_atomic_update() error: we previously assumed 'crtc' could be null (see line 597)

vim +/crtc +616 drivers/gpu/drm/gud/gud_pipe.c

73cfd166e04576 Ruben Wauters  2025-08-18  583  void gud_plane_atomic_update(struct drm_plane *plane,
73cfd166e04576 Ruben Wauters  2025-08-18  584  			     struct drm_atomic_state *atomic_state)
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  585  {
73cfd166e04576 Ruben Wauters  2025-08-18  586  	struct drm_device *drm = plane->dev;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  587  	struct gud_device *gdrm = to_gud_device(drm);
73cfd166e04576 Ruben Wauters  2025-08-18  588  	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(atomic_state, plane);
73cfd166e04576 Ruben Wauters  2025-08-18  589  	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(atomic_state, plane);
73cfd166e04576 Ruben Wauters  2025-08-18  590  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
73cfd166e04576 Ruben Wauters  2025-08-18  591  	struct drm_framebuffer *fb = new_state->fb;
73cfd166e04576 Ruben Wauters  2025-08-18  592  	struct drm_crtc *crtc = new_state->crtc;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  593  	struct drm_rect damage;
73cfd166e04576 Ruben Wauters  2025-08-18  594  	struct drm_atomic_helper_damage_iter iter;
c17d048609bf09 Noralf Trønnes 2022-11-30  595  	int ret, idx;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  596  
dc2d5ddb193e36 Shenghao Yang  2025-12-31 @597  	if (!crtc || crtc->state->mode_changed || !crtc->state->enable) {
                                                     ^^^^
Check for NULL

40e1a70b4aedf2 Noralf Trønnes 2021-03-13  598  		cancel_work_sync(&gdrm->work);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  599  		mutex_lock(&gdrm->damage_lock);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  600  		if (gdrm->fb) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  601  			drm_framebuffer_put(gdrm->fb);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  602  			gdrm->fb = NULL;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  603  		}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  604  		gud_clear_damage(gdrm);
c17d048609bf09 Noralf Trønnes 2022-11-30  605  		vfree(gdrm->shadow_buf);
c17d048609bf09 Noralf Trønnes 2022-11-30  606  		gdrm->shadow_buf = NULL;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  607  		mutex_unlock(&gdrm->damage_lock);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  608  	}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  609  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  610  	if (!drm_dev_enter(drm, &idx))
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  611  		return;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  612  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  613  	if (!old_state->fb)
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  614  		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  615  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13 @616  	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
                                                           ^^^^                         ^^^^
Unchecked dereferences.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

