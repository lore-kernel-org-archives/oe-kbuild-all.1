Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3199E63D0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 19:49:42 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id z26so2620749pff.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Nov 2022 12:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4xakcT52S41GW1ilDn/9QxixFg47wS1S9TQ0SXWIoI=;
        b=gtE3ML9d64S5PQNoxM60D+1bApDy6o3UHapbMync7kDs9mn/0uBNFO/QgZVdLUA4hh
         PwrQArj6/EjtPooURTnIlC3SivYOyzDIHQh3s2QCgtLPbjyB0wpsZKFCPr3RmiVkY7Ye
         QkilnI84Io3btJH1ASoonLlzLbellZ8FFCldwdWMb2m5Xi2Ch/2dKEadv0IFRQeyHfhM
         K9BCdMofDrV8o6qJ7WW0A1UZUkE8ub0/IB37iFjHoWLe9rIxhaEKO38H2vxIK157iUkR
         qgq74+/Fk/3VVdjDGf2vQiiZaARQpfVUhamI1BtRhfwxz4jF01OJ28AFXnG9zfRL54R8
         FL4A==
X-Gm-Message-State: ACrzQf1RfzhTHoj9dHEsoFoMbe7LBh8Ax9ky/erotiBkbcFMA5M9QtoQ
	kvc9fQCy1OY5DhakhClK8OzXaVX64pM=
X-Google-Smtp-Source: AMsMyM4ppfOc/0Wsx/frvVFhnI8LzQloOOSeQbrwqxOzTvQB3qEIh87tUb/erlG6gMiZlPvWmYlq+A==
X-Received: by 2002:aa7:8246:0:b0:56b:830d:e9b8 with SMTP id e6-20020aa78246000000b0056b830de9b8mr31919231pfn.46.1667504981566;
        Thu, 03 Nov 2022 12:49:41 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:881a:8a80:fdae:8683? ([2620:15c:211:201:881a:8a80:fdae:8683])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b00183c6784704sm982112plg.291.2022.11.03.12.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 12:49:40 -0700 (PDT)
Message-ID: <637d0840-5246-a71d-3fa6-ed27eda7a266@acm.org>
Date: Thu, 3 Nov 2022 12:49:39 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/4] scsi: bfa: Convert bfad_reset_sdev_bflags() from a
 macro into a function
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20221031224728.2607760-4-bvanassche@acm.org>
 <202211040328.Rq54Vqux-lkp@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202211040328.Rq54Vqux-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 12:33, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to restricted __be16
>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to restricted __be32
>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to restricted __be32
>>> drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int const [usertype] scan_flags @@     got restricted blist_flags_t @@
>     drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse:     expected unsigned int const [usertype] scan_flags
>     drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse:     got restricted blist_flags_t
>     drivers/scsi/bfa/bfad_bsg.c:2562:51: sparse: sparse: invalid assignment: |=
>     drivers/scsi/bfa/bfad_bsg.c:2562:51: sparse:    left side has type restricted blist_flags_t
>     drivers/scsi/bfa/bfad_bsg.c:2562:51: sparse:    right side has type unsigned int
>     drivers/scsi/bfa/bfad_bsg.c:2564:51: sparse: sparse: invalid assignment: &=
>     drivers/scsi/bfa/bfad_bsg.c:2564:51: sparse:    left side has type restricted blist_flags_t
>     drivers/scsi/bfa/bfad_bsg.c:2564:51: sparse:    right side has type unsigned int
>     drivers/scsi/bfa/bfad_bsg.c:3407:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
>     drivers/scsi/bfa/bfad_bsg.c:3407:34: sparse:     expected void const [noderef] __user *from
>     drivers/scsi/bfa/bfad_bsg.c:3407:34: sparse:     got void *
>     drivers/scsi/bfa/bfad_bsg.c:3561:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
>     drivers/scsi/bfa/bfad_bsg.c:3561:27: sparse:     expected void [noderef] __user *to
>     drivers/scsi/bfa/bfad_bsg.c:3561:27: sparse:     got void *

Dear kernel robot,

Thank you for having reported this. However, I do not agree that these 
sparse warnings are new. My hope is that a human maintainer of the 
kernel robot will read this message and will improve the kernel robot.

Bart.

