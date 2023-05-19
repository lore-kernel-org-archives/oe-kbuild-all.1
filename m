Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786E41118B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 16:28:27 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3078c092056so2310502f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684513705; x=1687105705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GJdeGWAzoXld9QLuODG0U2sKMNphJdDP2fBZjGvqmI=;
        b=DplTAsJh4Gbxe0zkwj+3EHsAdFZh18sUNl88kJ/NEb/DXR1dsnjoftCCqi4z/9mevv
         IWtqtGkjzz9Y1ReQBpZ0qPvPvoXejShcfCD5yqPcpXTsQdzyhoqUOJ3FoOg70LNskOAp
         VeDhpEeG1QzDzLefMxy9CqzXAHOYRvKRgI3VzUO3Hi+lwG+vKpKX2+odV+QEPgWOcj1F
         hSx7eiEyhOTsDio6UdFKqV7AnoQeB9W1jL7b62VrNdaKuwpxew64qxx94pnmjUhR/+37
         788dcnsOKcVDwjdPqoY5KxB2xYTdXf9geOSsbG65pmh9rQ76vORaVbiq5rbiaLsAxO2O
         P+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684513705; x=1687105705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GJdeGWAzoXld9QLuODG0U2sKMNphJdDP2fBZjGvqmI=;
        b=jc0nOEU62mRj87pIt8i7c92RzsFi2yJKXv4U55GS64Ztf86kIPHLES/sMRKA3J7a6s
         G5o3hYb0aR/IOes+0YAoYMk0RlDe0P/fZRmArG0KfkoUNCsWjqhQh8FvahWm6vQohpoy
         Pe6UDEQ7FImgplXZDM1B+xbmaHJXkNgYIb38bbCYfQbog+InWWl2dQyQZFAetUxycOii
         hpfLpgyzaoo/eftKwTDemViSas2IG9Pz19//HYiT6bSWGzrwjqtkBrqpQhKQTrd4VE8O
         +CZV41YeGxLrtc+uMXRIM0oBcEAaj0PkEFywworUQcIrfpSOjPRhN3jvYetunSqZSSSS
         85og==
X-Gm-Message-State: AC+VfDyX97e7HlOcnLE2037jt/+xNdpEgaQDCYIsCCJ5bmH7va8eLRWj
	luxTOJh8LRWdm4xC06s9trIC+A==
X-Google-Smtp-Source: ACHHUZ4+noNRFYc/gXg2MiArTOT/3T/uxKicgvezGE4QIW4v1m8aywHdparsRxmCv8wrI2tZshVofA==
X-Received: by 2002:a5d:4301:0:b0:306:147e:5553 with SMTP id h1-20020a5d4301000000b00306147e5553mr1867234wrq.23.1684513705606;
        Fri, 19 May 2023 09:28:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c2-20020a5d63c2000000b0030497b3224bsm5678580wrw.64.2023.05.19.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 09:28:24 -0700 (PDT)
Date: Fri, 19 May 2023 19:28:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1371 dpu_plane_reset()
 warn: variable dereferenced before check 'plane' (see line 1369)
Message-ID: <f286d777-8866-4207-83f8-2f1c81efdb23@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1bcbc6cd703e64caf8df314e3669b4786e008a
commit: 7f38ec140d9c1f257eb55d45d224a7203998d3cc drm/msm/dpu: move pipe_hw to dpu_plane_state
config: ia64-randconfig-m041-20230514
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305192230.fkMk4qjF-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1371 dpu_plane_reset() warn: variable dereferenced before check 'plane' (see line 1369)

Old smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:618 _dpu_plane_get_csc() warn: variable dereferenced before check 'pdpu' (see line 615)

vim +/plane +1371 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1365  static void dpu_plane_reset(struct drm_plane *plane)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1366  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1367  	struct dpu_plane *pdpu;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1368  	struct dpu_plane_state *pstate;
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16 @1369  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
                                                                                                     ^^^^^
Dereference inside the function.

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1370  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @1371  	if (!plane) {
                                                            ^^^^^^
Checked too late.

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1372  		DPU_ERROR("invalid plane\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1373  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1374  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1375  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1376  	pdpu = to_dpu_plane(plane);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1377  	DPU_DEBUG_PLANE(pdpu, "\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1378  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1379  	/* remove previous state, if present */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1380  	if (plane->state) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1381  		dpu_plane_destroy_state(plane, plane->state);
c9ef97b694b9bf Bernard Zhao      2021-05-09  1382  		plane->state = NULL;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1383  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1384  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1385  	pstate = kzalloc(sizeof(*pstate), GFP_KERNEL);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1386  	if (!pstate) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1387  		DPU_ERROR_PLANE(pdpu, "failed to allocate state\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1388  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1389  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1390  
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16  1391  	/*
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16  1392  	 * Set the SSPP here until we have proper virtualized DPU planes.
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16  1393  	 * This is the place where the state is allocated, so fill it fully.
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16  1394  	 */
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16  1395  	pstate->hw_sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
7f38ec140d9c1f Dmitry Baryshkov  2023-03-16  1396  
f964cfb7bcffc8 Dmitry Baryshkov  2021-06-28  1397  	__drm_atomic_helper_plane_reset(plane, &pstate->base);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1398  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

