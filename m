Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070521;
	b=hno8SIzJfcIZzXiD4Do0bppox/+ULQotvpF1dw1yJq8WSkY8DaVxqJWJ1Wf5XfTknBDf
	 Yt41JopCm7Et0ZNKb2VoaABufnkXM+xC516xBzf1DVPWsQfepODgOnPUdOA+F9xcFuU8n
	 FxbXOI1m/3mrHDBcZxgtqcA2v5eCsV1lp9VrEnC0KEwr7nXIw2JkCQbH/4FxkBwtwiD5P
	 R1VpKPG+A1o4ShfYwboyNL7R0EammpIqhB6uG6Qc0v7264fBGeHlhWDb7vj4BbjsqULYx
	 46aMzjiPFvBkFWAnIe6nuxy6P57gSVRe3tRJDxGK+HszgT4B33CVJAkBVyyR/QVA2hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=CbrQrYPj864sNBPbTz+UkOUsiRLn26jjLzWGOh/hKj0=;
	b=AVOFsn4PbCE3C+SnOziY980oza8rvQ03OvzKnp25bHza/mPqqnai1eB4Kkz2dfP15ANI
	 g2k2X5jFhBB30L2YeetaO1eH2k50c5LOLxzrWuYsjn+Hp7zya0mi6cU0xss2t4pqYq8dz
	 Zk1s/JtNG3Dv8CXEOzw1MEi696ugBH0HrLcVOO0QPp6R0ofzeEC5nicmypiWC1r0Uv/Qa
	 IEIiCV3vqJnklCa0rzbGqI+KadyJJ2Qfk6Kxu3lt7Adu8mBor3Hbl5kzRcihhrpTlXqTB
	 8TBAsYgZx0iMJrJilDG1ekG+P2y23vF4NxPoLrxMH9WFqHsAti3g7wNQpbKag4l7dNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnjV95BK;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222E3606A325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 06:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnjV95BK
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so1103857f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 22:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795070519; x=1795675319; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbrQrYPj864sNBPbTz+UkOUsiRLn26jjLzWGOh/hKj0=;
        b=ZnjV95BKpCpUNLqUKiT3b8bXbSijZVADl2KKgIXMoe4fxfAKYAF09isDmvq+dfZ3Kg
         iwuNvNmjc8vPOwZcnGZzivea/d9J4R8CHw2L8v2LBioFNfebBQZhhStWFOa81y7lIJQR
         JKGisdJT5t7ucgDEa9rB3dbiwu3yL9e7MBwT6PP2T9XdWUs5f2zPSbRtpqz5XMlR113C
         rAN0Om79FHvTlqIQhGB2ZrCcFBmsTh9nbJVG27dFctGlw3i6+k7JdX7Aenk8C9bVOU58
         bNAS5JxCHW9fAvI40h7/eH2E+y5xwzmdhYKyzBYGSrMkIAgKeaKxzWayge07vqkF47nW
         q4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070519; x=1795675319;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbrQrYPj864sNBPbTz+UkOUsiRLn26jjLzWGOh/hKj0=;
        b=STYkXPCaSdH9kL5TEyyphwqmAOGGiFRsmiIP60NVYIUP0XDLWf2dD+VO9TEnfsKoTh
         eodIZO0BBFsLHK9y33ESIwikYetp3LJUXJwwnRSMYcpYEEnsNb+TvHYH2JSYOQzfz+3l
         tmm8jsvQrgr+8DXPP3M4Q6xrcRgq9q2D5ZNsTHy2BaNtbWLN9XZ14+GpsJ9TEDI9dYbg
         X7sYtReJNLEECAUZIN6WYdwMEozFCQtqwcyW1T0IVOHJOs2JFm6OjYPTjduVahOMep05
         q/cqIL7Iwg2Gk/aOvNWCXPIU2By//8TsL8KilBMaBx/0pIR+xGyfsnwqb5URGQwJHr5J
         uxGg==
X-Forwarded-Encrypted: i=1; AL+hErH0Hgtu0R8ZtY2LqGczk80BMz+TWuVRkpJOAOvpByquxc+cKtNIvp+iiWcJG1PJf4nlxopLLjZLoDLSGW+p@lists.linux.dev
X-Gm-Message-State: APuU4Z/TXdLb26DPs3K9RPwUp25a3+oxBHrnHCs+fF8yYQWT9aCGRQa4
	P4oT9iOpcrqWQyrL75IHdEwbl/UzqENrUDxNZ4BE3C67izwQqYc7cAO2
X-Gm-Gg: AZFdTZfFJIumbE+9H/aR88k9fqzsWEgjfMqSJdie5aDnZxojUT3Y7cfePxnq8DgQyLM
	33Bv28O/zeQddTAjHp/6VdF0Te/YHHa+9s2ZAJ0xTS+9eJvftvnadBohsbCh8jnLOLdubDn1ph0
	NCV0ZYhPXxXetabhvNkQ2byqUv3saOGFPkfxCTss/7GHqfpXX3Z1SKzx8pSdLsDtN34vCLIMctL
	EDz/gsQxWUTxuSqNISCjTkj/Oq6lZxpgcSNJPlsIxYA3JEsAZRvOZ0lkbjb5j5LC46gXBGi2IQH
	TmN/7WnY1EJLyHwcmHPNXULViP5nVXAnqKcFsjuXSKPClSWwfniNiYNyMPzbcIetTSGqDJYLVSR
	c6MNxZkKe/XyD2x39gPHMiA2QFAJCqUFwWs8/TslsZbe9x5Swv2lLyaGBdsAeoyR/MFvvAAS52k
	RPiENVGo0xmY+5mbUNs1h4ouYLiFG7qjIiJ0ima+TWuP8+xcmu5+U1uoexXJ0TQEG+t8eob8yDG
	k6L31y7kyvb6mSA0GKExVGwliSGCYrKAGCvHwsfctUBhVBZ74bRdNlgNEOjXcBGfq4nc/Laazpg
	lPM1Ci5PeA+cL92FG7CV08RwlDpMY/cc/csi1qMvUL0XxbotmDyWZdf3HZodiLl8WcGp2kbbdBk
	FySTA3PFWkx/UIfroIegmmSN39Dwv8XrKX6YyAfWfTEaa1Dzmqvwnt0FoOARWf5+IL9o=
X-Received: by 2002:a05:6000:4b1e:b0:498:bc2a:8f31 with SMTP id ffacd0b85a97d-4a6389ece92mr10513314f8f.19.1795070519350;
        Wed, 18 Nov 2026 22:41:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560882asm9271363f8f.27.2026.11.18.22.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:41:58 -0800 (PST)
Date: Thu, 19 Nov 2026 09:41:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 200/200]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c:142
 reset_hpo_dp_stream_encoder() error: we previously assumed 'dccg' could be
 null (see line 140)
Message-ID: <20261119055333.15uYya1M-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: 967ebae13e206b90c2ef57b917adceaee1fa5390 [200/200] drm/amd/display: Prevent crash when disable stream
config: arm64-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119055333.15uYya1M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119055333.15uYya1M-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c:142 reset_hpo_dp_stream_encoder() error: we previously assumed 'dccg' could be null (see line 140)

vim +/dccg +142 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c

9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  128  static void reset_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  129  {
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  130  	struct dc *dc = pipe_ctx->stream->ctx->dc;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  131  	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  132  	struct dccg *dccg = dc->res_pool->dccg;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  133  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  134  	struct dtbclk_dto_params dto_params = {0};
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  135  
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  136  	dto_params.otg_inst = tg->inst;
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  137  	dto_params.timing = &pipe_ctx->stream->timing;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  138  
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  139  	stream_enc->funcs->disable(stream_enc);
967ebae13e206b drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Chris Park    2024-03-05 @140  	if (dccg && dccg->funcs->set_dtbclk_dto)

This line assumes dccg can be NULL

0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  141  		dccg->funcs->set_dtbclk_dto(dccg, &dto_params);
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28 @142  	dccg->funcs->disable_symclk32_se(dccg, stream_enc->inst);

The next line doesn't

9af611f29034dd drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c George Shen   2022-08-10  143  	dccg->funcs->set_dpstreamclk(dccg, REFCLK, tg->inst, stream_enc->inst);
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

