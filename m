Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424F19C54E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820939; cv=none; b=HKfjq5SE4fTHwd+O46KhHQvRwIT39VEwGKW99Tz/TkN6K8P6oCIPY2/qBNKyqfJuvWxREiODyn/bbQIzfX8jBK5162N4fm6Oc4pOqOYYRIwM7zt5xlqEASLQUtb3Ueh0D56EmwrXmrtV1T4/q0i0hiT4MZktiil9I7fCQo4QMI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820939; c=relaxed/simple;
	bh=6vUR9lePzA9GLPF/d2DhXC3cdbAJ/XPuDA9mqrPDWPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RS5oOO6jZEYwiw92MJdOIvOrYDe9IRTNxq99cJuThJNQ2V/kKze/uWqZ2bpTxMapMGD5WZ672yk6Uy0CNIA6sS2zsz6isZcl9seU5KGEiSMRIfGWJ/PFoBx+zkND12NsQ7eg9lMSlQSr9QAvdNtsXNCGUbNsUBtwtYD+/Tqc/Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiN0rqrv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiN0rqrv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b78b638eso6331467f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Mar 2026 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820936; x=1773425736; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rriMUzh31RKjt/5T8gDUKHkgaP5StcNn7rIgMnKm1IY=;
        b=ZiN0rqrvCCDdq/EjZx+kIhURo0auoM7/nK6Hzh8G9SPx5jR30RwZY7GH9k/ibHgXqO
         Xo2WJJKDo08ZHdRRm58YpAKRL5hRsz5aV27H/SW/ISrfGxcvxafFXf1nGouVMtLE9GUg
         GzbPKfgB1QQIr1j1BKz/OKaq8pVmzw+dPWvZiim0CEWCCwKhCfCK7wmdbBUhgrgzDOBy
         uEGXyqlnkowfmGoZEVm9wL3kwrQKCsCuqV1RGYkYy6FKPl5IMZX/SHq+rjPHx7BDYkcn
         yTpRdCrX3tcGw+SZV8ppD8ZukKNpISH5kVRuoUpBk27GN6pBz61OTE4+gpnAo2r04VVk
         bDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820936; x=1773425736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rriMUzh31RKjt/5T8gDUKHkgaP5StcNn7rIgMnKm1IY=;
        b=JbNR1Cl66Xq3FaufNroN4OGESCbE2Ygp2I0u205uQoYhfATjpx00wZrLQ7FESY/jrS
         /KvnE2m2Q/rl2V+8oUmO3Y08dFR1xLLLowbRTvuy6SVV6oXBlvIGYuxVIaeFREC5Szca
         9f+NR//Ezn8pRWhJpSo77q0KmSVdBUvP4jRqNoCHZWCMyNspcjSq3POU0KVieGzzwyJ2
         8tZ0GSChymcNSUTH1gvze1g35dfAOEv8D8CkvWPxWaUTUj2Ob8+kUb9EtYemv82vTWB7
         FjTWx7zNQvCnDjMT+wnwxsfZX0vcTeHlSLkaTtIjciWy11VAgr0vsv+00901GojXFNMw
         POpQ==
X-Forwarded-Encrypted: i=1; AJvYcCViCjGlu+JknyK4REYMXxK0YNoQWdbNsD4ZICwsUs6YsXqP5EMp8ASKOrca6JaNDnVTPTlZyU734WtAt/3y@lists.linux.dev
X-Gm-Message-State: AOJu0YxFCqKcBpckI/XWNSGdILNdlEzipqwZE0KwByKjoREPlt0a3Ylj
	Igi/uOy3hMOuKEFQ4YV0dq71qVrqIwIOYHN3goY87E18+dtsqLbr4n7XVmESXHrOGiY=
X-Gm-Gg: ATEYQzwFxFt0Im2S8lg8nuL4Zy1WNglDlV2VTZICvicrvZ72TO648/y48Oeu4K+/YI1
	Z7lGePJoCDULem/F6iDj0W6wXaeWWMENDY4uYC2m2JNZWqWQYvWIofeLvdf/U/uURki7FPr9Mi+
	yNzAe1J00r4qMidlfqTEadBZVFfbKgvYC7X4lD/lFNxeQMytSkkg99tfpwqeQxDTRdfvNOVmGBm
	jD5gkz/uJMQL5Pd6NS0hQ35N4W00cVlELu5bWwSUXxWjm6cAzCdRDenfdlhTnK8VvkzPC2BtOL9
	CaSGZypwE+vkwUb9lWaFiSBJT8gS4SEZu7i230oNzSvlzENIMcJt0wX+ImY6gmEItdUJm1WP2Aq
	p3TVyBzt22qpipX+aOP5lVHHN6HDI+Xg1bqR5+JpJJWrikjoefflJpvuMnaayAsJIo1GpGmPmC8
	wEiX3Eq+B8b7hejTTar3Ded3u+Rb6G
X-Received: by 2002:a5d:64c7:0:b0:439:cd8c:209f with SMTP id ffacd0b85a97d-439da662501mr5804360f8f.23.1772820935470;
        Fri, 06 Mar 2026 10:15:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm4701625f8f.29.2026.03.06.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:15:35 -0800 (PST)
Date: Fri, 6 Mar 2026 21:15:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 685/685]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:247
 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null
 (see line 244)
Message-ID: <202603062103.GcIsRo8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   4fc00fe35d46b4fc8dac2eb543a0e3d44bb15f47
commit: 2e150ccea13129eb048679114808eb9770443e4d [685/685] drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
config: i386-randconfig-141-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062103.GcIsRo8v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603062103.GcIsRo8v-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:247 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null (see line 244)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:254 dcn21_set_backlight_level() error: we previously assumed 'abm' could be null (see line 244)

vim +/tg +247 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c

474ac4a875ca6fe Yongqiang Sun        2020-04-27  234  bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
474ac4a875ca6fe Yongqiang Sun        2020-04-27  235  		uint32_t backlight_pwm_u16_16,
474ac4a875ca6fe Yongqiang Sun        2020-04-27  236  		uint32_t frame_ramp)
474ac4a875ca6fe Yongqiang Sun        2020-04-27  237  {
474ac4a875ca6fe Yongqiang Sun        2020-04-27  238  	struct dc_context *dc = pipe_ctx->stream->ctx;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  239  	struct abm *abm = pipe_ctx->stream_res.abm;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  240  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  241  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  242  	uint32_t otg_inst;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  243  
2e150ccea13129e Srinivasan Shanmugam 2024-01-27 @244  	if (!abm && !tg && !panel_cntl)

Presumable || was intended instead of &&.

2e150ccea13129e Srinivasan Shanmugam 2024-01-27  245  		return false;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  246  
2e150ccea13129e Srinivasan Shanmugam 2024-01-27 @247  	otg_inst = tg->inst;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  248  
474ac4a875ca6fe Yongqiang Sun        2020-04-27  249  	if (dc->dc->res_pool->dmcu) {
474ac4a875ca6fe Yongqiang Sun        2020-04-27  250  		dce110_set_backlight_level(pipe_ctx, backlight_pwm_u16_16, frame_ramp);
474ac4a875ca6fe Yongqiang Sun        2020-04-27  251  		return true;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  252  	}
474ac4a875ca6fe Yongqiang Sun        2020-04-27  253  
6f0ef80a00adfd5 Leon Huang           2022-12-08 @254  	if (abm->funcs && abm->funcs->set_pipe_ex) {
71be0f674070a5a Lewis Huang          2023-12-01  255  		abm->funcs->set_pipe_ex(abm,
71be0f674070a5a Lewis Huang          2023-12-01  256  					otg_inst,
71be0f674070a5a Lewis Huang          2023-12-01  257  					SET_ABM_PIPE_NORMAL,
71be0f674070a5a Lewis Huang          2023-12-01  258  					panel_cntl->inst,
71be0f674070a5a Lewis Huang          2023-12-01  259  					panel_cntl->pwrseq_inst);
6f0ef80a00adfd5 Leon Huang           2022-12-08  260  	} else {
71be0f674070a5a Lewis Huang          2023-12-01  261  		dmub_abm_set_pipe(abm,
71be0f674070a5a Lewis Huang          2023-12-01  262  				  otg_inst,
71be0f674070a5a Lewis Huang          2023-12-01  263  				  SET_ABM_PIPE_NORMAL,
71be0f674070a5a Lewis Huang          2023-12-01  264  				  panel_cntl->inst,
71be0f674070a5a Lewis Huang          2023-12-01  265  				  panel_cntl->pwrseq_inst);
6f0ef80a00adfd5 Leon Huang           2022-12-08  266  	}
474ac4a875ca6fe Yongqiang Sun        2020-04-27  267  
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  268  	if (abm->funcs && abm->funcs->set_backlight_level_pwm)
6f0ef80a00adfd5 Leon Huang           2022-12-08  269  		abm->funcs->set_backlight_level_pwm(abm, backlight_pwm_u16_16,
6f0ef80a00adfd5 Leon Huang           2022-12-08  270  			frame_ramp, 0, panel_cntl->inst);
6f0ef80a00adfd5 Leon Huang           2022-12-08  271  	else
6f0ef80a00adfd5 Leon Huang           2022-12-08  272  		dmub_abm_set_backlight(dc, backlight_pwm_u16_16, frame_ramp, panel_cntl->inst);
474ac4a875ca6fe Yongqiang Sun        2020-04-27  273  
474ac4a875ca6fe Yongqiang Sun        2020-04-27  274  	return true;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  275  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

