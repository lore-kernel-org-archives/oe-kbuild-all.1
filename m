Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498826;
	b=Bg2p7ydHNMQZywf7CI/2ZbJmbB6ekO9cRMVAyQDeasnHYhqe58ED9vtpLPLSYiHTvbKG
	 RCXwcZ8N3YskBsCMEJj5stl7/WnIe9/IdgwTlH4Kzvvx4pi60II6CNOSGXudtvD7UntwM
	 6KsCmLqKK5O9NB5OXfGJxFcp815+vBkX2VCgJTXViOkvvmax2Krssf1tahT1uIBYibL4v
	 Z/fqIkNjieBb7tLsxYOPWR+2hPHeONP/ks2LPBIo5pRrGuyBgAaZqY/CRHFrqmgDK7Be2
	 5jJ7aiNWXHUV0qYFSf6BCFbJLahxBJKVMWpR5LhWy1D8JLFNslyg22wUgptCjB+VTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=A8Q09a4dES6QQ5TG8UKgsKYYXz+8dnpoMSRQXu99C/s=;
	b=1c6C3RsP6yUDq9GwyQQOGCpjpBhg0TlLiycqEHeWLjB6zUVNegoyesY03Zx1/1Clb9bI
	 VA7iIKXymKgmF/NxgstIy8YtWFsJv7sEJllkQ9mFlj92CaXUyXFnrV0hW36X49kM6c9Y1
	 BpAP1YBAJS7Z3FB5BkxUssOqD7Oy8TmJJiPLcvG3SDH0Wl59E4qpjy7E9aFN98IKz5MgE
	 HgDUenP9f5ICXK8pxF2ScIiuzLqtPXGVWq+s68uXOettmdiIMBEsQpTpT5nFlzY7d3cBL
	 fBUBMQvR1eTaL+FIxfL3rNmxWzAvpYmHEQi9Mw48azbjpo94vxZL7U3CkoA0L960Hng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhy65RO1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45FC606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 05:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhy65RO1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so35434045e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 21:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498824; x=1796103624; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8Q09a4dES6QQ5TG8UKgsKYYXz+8dnpoMSRQXu99C/s=;
        b=vhy65RO1vsF5W2zga3GgIdPAEIaDa9wtpKNNg2m54GDVxl9R+dmVyGy5S7MDhvk43z
         6kC/4GJf3s4WSnYtPuTz0PI/4fbakEVjxtKViLdO2F/0Wzf1D25GZgQr9pAdYGtfMnr6
         TvrRXmZroX0p2ncw5B9w+SKrmUrchd+kNOkZPq8AjQCmVsazVs2I3DLRWRCqNyj3GoYC
         eH/T94ilzhMgNDwSWwT+HlyXRXI5vgcYcPXRjfYc9Xle1db5MnfHkcm/gIaE5mBcjYZE
         yntCnHJvDtyxBa3Mq8oYgZGKKU8oTQGjakT0Fef4rdM1TKjTMWrMLBBox2MxYUZkFqIw
         lSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498824; x=1796103624;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8Q09a4dES6QQ5TG8UKgsKYYXz+8dnpoMSRQXu99C/s=;
        b=ZBZcdE1iQlch5pXtcZGz8POuCLrtdLCDwPjJcfsWaURX8f1OsWyNccS58AbSrpaLhL
         aDztbGm5xdCAiE109D3KbUBEVT3HFVtDUEoGGgN9CqPuhxwjLwiYqzMpp/RS0Zc2rWOn
         mjHV6SFYXFLeg/poqho3uUCdneWj6g7b7456c2MuPicjYtzFTuYYglQDmxWGrBOVTgI2
         G/eQ7xrRqkMKwKVtqQARzsV61LGHFg4dmE6D9gV1s6lsGpt6ZAiNdi0bTTB8FLKOmTgS
         EvrbkxwGGirLm8DVMzwIBX1XxEh5BfE28v97M7ReAdM1xUT86mYx5pw5FUFBLEmJVEFv
         nlQA==
X-Forwarded-Encrypted: i=1; AL+hErG/Wg+Xg3ixmW22VmWhOttCCxnFswtPq+n8I4TdWHPoE6lWOPEosyb6ORYn3ZYyKL9z+L98k0mBNsnfVhva@lists.linux.dev
X-Gm-Message-State: APuU4Z/zNpgkR1QdJaGeqDwBevltMGrE7Wk2df4DRUWoGsPWFJvd9dVl
	QyxhfFm83HhO6uqCLCm+SEiHvS5ItV3CS8WbE4yvYhqIIKmcwersWJ/O28x4IkowjfBO6Fie
X-Gm-Gg: AZFdTZdK1k6X2gT6oXTyuodqHB+PNpv4vuyAhN9HaR4EO2GW6M5HekUkZXhK0a2yO71
	PFO9oJYaz7N0v7H/8zY3WNcC8+HndM9G/3AmGkLmCqdfjK6TTIfz226pDxI2y86QeDAtlUMjdIx
	H/QUHMXGOS56Nvg9PVgaRlx8rC7A/WPJQ7sIa/96GXCK0lGiUvllvgaykAf4y6Y656HNUgP1ysN
	Id2EZvbmlZkVhxyuueCwNmZnIZXbvbZtzcg3mvfEgJ2XLpOChUjdsFKOYblT3e/7WSdmcWtke+M
	wLZTPGYPnpAZBCRPdiojWCes54ZlW/v+oSi52OBOSlgY721wpCGPWTGrYG5C34qffAJI1yEdhie
	26h8iwlTSy1e9OSDuzytL1EA0ouPSvmA5GjU06+bj4qamXzneDJ5f+1lVrSSf7RzYjq5uqbG777
	9/K5ewaNZCMmIqlgp0oPH/sulp24DOrMt9+FIiIoHAyxeqgQl/uDxUf56KduTPVFUpDZizPzUFq
	xSS1tkmHhHXXMaX/8xd3w06iRHdrIfuc0Yq/pCTQ5KJ3fvhXPOzbNoOhSr2eaEN4t0lV8XmiI9+
	nNa6H1eWMItTZEy/H9zOL/y2qPNk9l6YxtS3rimDC97oke1kN/s674wOvPVlHvDmxjWEBeLIzjT
	UXCLIXhivmVA6M06HdOx5KTGlvyFG31AvwjlFQrN2rMDi1e0RkGE7IUz+HrXTAg9fKgI=
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr263479525e9.8.1795498824066;
        Mon, 23 Nov 2026 21:40:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm395386355e9.6.2026.11.23.21.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:40:23 -0800 (PST)
Date: Tue, 24 Nov 2026 08:40:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v3 118/122] drivers/perf/riscv_ctr.c:435
 riscv_pmu_ctr_sched_task() warn: variable dereferenced before check
 'pmu_ctx' (see line 427)
Message-ID: <20261122185842.ByS8sFyu-lkp@intel.com>
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

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v3
head:   e16e3a60fbbf3fa3da230a7151235d2e7aac1066
commit: 9a740a6a4e590a1cc20dc8aa7d80a73171ba6229 [118/122] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122185842.ByS8sFyu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122185842.ByS8sFyu-lkp@intel.com/

smatch warnings:
drivers/perf/riscv_ctr.c:435 riscv_pmu_ctr_sched_task() warn: variable dereferenced before check 'pmu_ctx' (see line 427)

vim +/pmu_ctx +435 drivers/perf/riscv_ctr.c

9a740a6a4e590a Vikram Singh 2026-11-18  424  void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
9a740a6a4e590a Vikram Singh 2026-11-18  425  			      bool sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  426  {
9a740a6a4e590a Vikram Singh 2026-11-18 @427  	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu_ctx->pmu);
                                                                                       ^^^^^^^^^^^^
Dereference

9a740a6a4e590a Vikram Singh 2026-11-18  428  	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
9a740a6a4e590a Vikram Singh 2026-11-18  429  	void *task_ctx;
9a740a6a4e590a Vikram Singh 2026-11-18  430  
9a740a6a4e590a Vikram Singh 2026-11-18  431  	if (!cpuc->ctr_users)
9a740a6a4e590a Vikram Singh 2026-11-18  432  		return;
9a740a6a4e590a Vikram Singh 2026-11-18  433  
9a740a6a4e590a Vikram Singh 2026-11-18  434  	/* Save branch records in task_ctx on sched out */
9a740a6a4e590a Vikram Singh 2026-11-18 @435  	task_ctx = pmu_ctx ? task->perf_ctx_data : NULL;
                                                           ^^^^^^^
Checked too late.

9a740a6a4e590a Vikram Singh 2026-11-18  436  	if (task_ctx) {
9a740a6a4e590a Vikram Singh 2026-11-18  437  		if (sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  438  			riscv_pmu_ctr_restore(task_ctx);
9a740a6a4e590a Vikram Singh 2026-11-18  439  		else
9a740a6a4e590a Vikram Singh 2026-11-18  440  			riscv_pmu_ctr_save(task_ctx, rvpmu->ctr_depth);
9a740a6a4e590a Vikram Singh 2026-11-18  441  		return;
9a740a6a4e590a Vikram Singh 2026-11-18  442  	}
9a740a6a4e590a Vikram Singh 2026-11-18  443  
9a740a6a4e590a Vikram Singh 2026-11-18  444  	/* Reset branch records on sched in */
9a740a6a4e590a Vikram Singh 2026-11-18  445  	if (sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  446  		riscv_pmu_ctr_reset();
9a740a6a4e590a Vikram Singh 2026-11-18  447  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

