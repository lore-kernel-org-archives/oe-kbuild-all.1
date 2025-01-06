Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8FF2AE94
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156630; cv=none; b=EusEkcaC9jrhI5Spbm1++ieaUViMzlpLkUMi68/wIDdCvWIvna8np85aD0IXLsraNtoAq7hrv130CEiNvwv25kCIOXD/UQwBi0esi1DlXpJ9vrdEbwVZ+kzRJ5VrhLGnM/eaivSZyCbTfvv5MsFlY9Cd6lsaT3dnrf0DqP307Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156630; c=relaxed/simple;
	bh=nn88hpp6nf5t1s45ZH0IpdaFSlKDUzV8ZiHfDn7X76s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ndXlGThfQAb2zoT6bzzDcLbhuCtSO2l7x5XHgZymL9z+rdmrb0oCsQRySGF2WjJyWb4DindSzQkl/4peTCoQLC6jpiIQElyHWHIOuVy+r2eTh7n8zMAvcJaqa+bbIUioYGlJJOeVcfJT4FPpg5kLEmEUXgLAip99Dsu5//WPnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lg59vwNE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lg59vwNE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43634b570c1so101228475e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 01:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156626; x=1736761426; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+dNzGeurdxTiF3lweD7uy5ZExBGDAhgDE2t5fP9vpw=;
        b=Lg59vwNEtzcDD/lh+EpFJ8baxjGC4Nr7tGJP3ptNm+aXPOEZVlZGxSvp8EClHNr+fx
         HNg55ga6KekDifT9dOXohX/1RzWG4urYV+b3VmIKoNRXcXGfxoDihBvaTQhoLJ0ZtkRv
         Hxf4aAdUKbBHzojkvdfKPPQ4uVjUCFAxfPgGkfcvNF6s4oIIcQiATBlR91FwH2vahSH6
         mNF0pDbyV0JoptZ3SqEonHyujE0q1/LlQ/BH7kpF6O1zeJVSPjeBR5oYdreLEsCiCDVj
         oPwrqoiBBRGZqYc5ntDC+CiJN6Np730mUx6RTmVtL/G3e57OlYr8aNoxW/oeLrrFT0zn
         MSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156626; x=1736761426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+dNzGeurdxTiF3lweD7uy5ZExBGDAhgDE2t5fP9vpw=;
        b=TECsOm+t34kH5qXXI+dF6M/WYMXx5wK1Oxrt3JXZJa3i6XSNwQ3GUa09bTsQJ9uNcK
         /QG9fsC1SJ2Cq7VdCleBg87EJXYeFst5J2BPijk4Fk603UDppXgsS+JAfyB1Bx3YyHVX
         ebmn9vDzZ61Y+sywCHyOfEZbFbORJdGfyEndw32PHVBXvYmD77w3tUazc9/0T//EsLW6
         WSSM9ha2Tv8stK3mFm9SuoV/pJoG7dHQ/yz+YETr2cBVPeVfgEnx2Dok/ZbuERckOsHI
         QVwwHyEvKPIiAKu/NQq3RSyjnH35aKjcqOhJwFpj7w2wWGT1zhf+e/S04nrpUhHNS3xD
         9tjw==
X-Forwarded-Encrypted: i=1; AJvYcCVKceI+ilYLyV77phxcYrMbYTNVnPTHVsUYHroWbPZVWxaa6WmMbH+zrb7ektR4ed4YlgW54yTQr+DnvAE6@lists.linux.dev
X-Gm-Message-State: AOJu0YwIbB9mlBWjrwcdTPH0bYcmtoghQEUqRfxHWdR6IZD7iMK63PW1
	T/Ee0wbuN94djKcyJ+s56xC1CxiihVWOvkq4IlHT4SIcfHXpdXKTQ1tktJU7zyY=
X-Gm-Gg: ASbGncvI4ktGZoHhOLi83V3H+LM0AK6XmIFtCRrastCCYffkxSrvfAgRkoqCCN9YlJQ
	YvTOU2wCc3WtDik79BX8H1Bd8S3uPHJULY5jqKyHaBco56NtGB237TxuCPVflH2HQJujJjNISVf
	pzXcvsrmOXEzDDiz28ARIDveBBZU22iUXh/B6sLwVC0ejc/3Pufiu5Kde87GezojTl9ZYnhZF0Y
	U/zKuLfySy7IiQoRKlv2kpE9gFF52APL5Jf+cHdvFn9shg1Iki4LTh8Z/M2Cg==
X-Google-Smtp-Source: AGHT+IGXyfzClNPiHyW2GNgTFvRt33m5nLlGBHLrrlc1xwKG0qtkGFBadXCTz9nR7y031prj/lvvTw==
X-Received: by 2002:a05:600c:46ce:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-43668b78d1fmr459372995e9.29.1736156626486;
        Mon, 06 Jan 2025 01:43:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366e210cecsm527334305e9.2.2025.01.06.01.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:43:45 -0800 (PST)
Date: Mon, 6 Jan 2025 12:43:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [lumag-msm:msm-next-lumag 13/20]
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1042
 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.
Message-ID: <849910b1-10d0-45bb-aae4-87c55d2b6dea@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag
head:   c9261bcc1546a564407513e148c35a79a58bc2b9
commit: 774bcfb731765d092992136b54c34958d7c64bea [13/20] drm/msm/dpu: add support for virtual planes
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231937.tOzYv4oB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412231937.tOzYv4oB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1042 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1130 dpu_assign_plane_resources() error: uninitialized symbol 'ret'.

vim +/crtc_state +1042 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

774bcfb731765d Dmitry Baryshkov 2024-12-15  1027  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1028  					  struct drm_atomic_state *state)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1029  {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1030  	struct drm_plane_state *plane_state =
774bcfb731765d Dmitry Baryshkov 2024-12-15  1031  		drm_atomic_get_plane_state(state, plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1032  	struct drm_plane_state *old_plane_state =
774bcfb731765d Dmitry Baryshkov 2024-12-15  1033  		drm_atomic_get_old_plane_state(state, plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1034  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1035  	struct drm_crtc_state *crtc_state;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1036  	int ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1037  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1038  	if (plane_state->crtc)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1039  		crtc_state = drm_atomic_get_new_crtc_state(state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1040  							   plane_state->crtc);

crtc_state not initialized on else path.

774bcfb731765d Dmitry Baryshkov 2024-12-15  1041  
774bcfb731765d Dmitry Baryshkov 2024-12-15 @1042  	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
                                                                                                                ^^^^^^^^^^
uninitialized.  My guess is that it isn't used in this case, however passing
uninitialized variables is still considered a bug.  If
dpu_plane_atomic_check_nosspp() were inlined (it's not) and the variable
isn't used then that's fine.

774bcfb731765d Dmitry Baryshkov 2024-12-15  1043  	if (ret)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1044  		return ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1045  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1046  	if (!plane_state->visible) {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1047  		/*
774bcfb731765d Dmitry Baryshkov 2024-12-15  1048  		 * resources are freed by dpu_crtc_assign_plane_resources(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

