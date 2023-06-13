Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D18BE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 08:29:57 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f8c65020dfso5984145e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 01:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1686644996; x=1689236996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fJz3+17+rI7c/r9Lxv1o3gM9l7EUudwPFAZ2efkW9cM=;
        b=QtW2Ic+jqj4l0V4rUR3g5XwyEe5HAeSBmgBIeCA9Ahj+oPxHvnoLzvMLrdI0W/PdQN
         NwQTFeVR+CSpq0rd/5K1de/PZ+FysmEXscm5FEMlKUUjbd/CnE23w70QNKdB8nNMRWqF
         7iBzg3F8LKamO3rVyJlQGU6+gjTRiNf7mAbKa7hVqJpcoAjV9CnS/btZlLBqmlU0SC1U
         JRHK6RES+ADnMIcHld/rOi8iUGX/+pibfDpN6UTLVEBnJ10WZdrdqHJoK9IrrrDMST3g
         4ooqSpiMqi75GZgOy5Aiu+MSKIXLQR0kgWeu/BLkYMdsbW+eB7Qmvp93LHMahbMfDgaK
         Dheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644996; x=1689236996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJz3+17+rI7c/r9Lxv1o3gM9l7EUudwPFAZ2efkW9cM=;
        b=EJeu0uVmKwqGOtDRXCWH9etHX0fteCSjJXYv6sQmTB92LsCTELT3ItCZ5fKmNqGJmh
         AeMtnPUNCdjSLFAkadGbQ6VuCxTp/B/asV7UMUxEhO/WufPDhxkdtuD8cI+UMhr4pHk4
         zdVL8OpR3jv7x6SdfaDQmqfFrvtE9C1ZTL/LXug+F4RMV4CH8vnpLwrXmGp8x6gfDgf/
         3sWlyjeTOQU9vCmbEuWIeh2idVhadxZU0OJmNjjyGsVQ6TPMEkt3Ul5h1ysWppKJcPhO
         X9v02amrDkg4Dcpjjr0O+EQ04BNbwVss7SGt79HUHEyhNI2AXEiarpiTTLFF7lBvwGux
         w8TQ==
X-Gm-Message-State: AC+VfDxlKZ7zGr0zl/NaUhUJ0e06lwKSoOZq1Axr6sd+aVh7A4E5rPWH
	x8OKmHlB2ZoqWrXaHv1348ADaw==
X-Google-Smtp-Source: ACHHUZ6VKL3vVviuMXqByKDjVuBWHuEoYjd4AUXr52K2TFKp398Trwaduu/AdesUxduSSatDHxYwsQ==
X-Received: by 2002:a7b:cb8f:0:b0:3f7:26f8:4cd0 with SMTP id m15-20020a7bcb8f000000b003f726f84cd0mr8651529wmi.16.1686644996018;
        Tue, 13 Jun 2023 01:29:56 -0700 (PDT)
Received: from zh-lab-node-5 ([2a02:168:f656:0:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id n26-20020a1c721a000000b003f78fd2cf5esm13645608wmc.40.2023.06.13.01.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 01:29:55 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:30:23 +0000
From: Anton Protopopov <aspsk@isovalent.com>
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, bpf@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Joe Stringer <joe@isovalent.com>,
	John Fastabend <john.fastabend@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: add new map ops ->map_pressure
Message-ID: <ZIgpH43cHO9ZEz73@zh-lab-node-5>
References: <20230531110511.64612-2-aspsk@isovalent.com>
 <202306010837.mGhA199K-lkp@intel.com>
 <ZHhNqDi7+k5VzofY@zh-lab-node-5>
 <ZIgngQXrlaCtAYgl@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIgngQXrlaCtAYgl@yujie-X299>

On Tue, Jun 13, 2023 at 04:23:29PM +0800, Yujie Liu wrote:
> Hi Anton,
> 
> Sorry for the late reply.
> 
> On Thu, Jun 01, 2023 at 07:50:00AM +0000, Anton Protopopov wrote:
> > On Thu, Jun 01, 2023 at 08:44:24AM +0800, kernel test robot wrote:
> > > Hi Anton,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [...]
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202306010837.mGhA199K-lkp@intel.com/
> > 
> > How does this apply to patches? If I send a v2, should I include these tags
> > there?
> 
> If a v2 is sent, these tags should not be included.
> 
> > If this patch gets rejected, is there need to do anything to close the
> > robot's ticket?
> 
> No need to close this ticket.
> 
> Thanks for raising above concerns. We have updated the wording in our
> reports as below to avoid misinterpretation:
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: ...
> | Closes: ...

Great, thanks for the explanations!

> --
> Best Regards,
> Yujie
> 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    kernel/bpf/hashtab.c: In function 'htab_map_pressure':
> > > >> kernel/bpf/hashtab.c:189:24: error: implicit declaration of function '__percpu_counter_sum'; did you mean 'percpu_counter_sum'? [-Werror=implicit-function-declaration]
> > >      189 |                 return __percpu_counter_sum(&htab->pcount);
> > >          |                        ^~~~~~~~~~~~~~~~~~~~
> > >          |                        percpu_counter_sum
> > >    cc1: some warnings being treated as errors
> > > 
> > > 
> > > vim +189 kernel/bpf/hashtab.c
> > > 
> > >    183	
> > >    184	static u32 htab_map_pressure(const struct bpf_map *map)
> > >    185	{
> > >    186		struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
> > >    187	
> > >    188		if (htab->use_percpu_counter)
> > >  > 189			return __percpu_counter_sum(&htab->pcount);
> > >    190		return atomic_read(&htab->count);
> > >    191	}
> > >    192	
> > 
> > (This bug happens for !SMP case.)
> > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > 
