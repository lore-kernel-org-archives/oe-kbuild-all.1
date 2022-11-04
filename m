Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEB10F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667551157; x=1699087157;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wUMwNmHY+brF7GI+X+A5+82GqR0m7T4s0KqG0W4CLjE=;
  b=IL8GvYKknK1McmsoeH97kK0Tlg3wuiZomOAYk8v02yuWrrpzur4daZ2I
   Mf1cMelSgGx25imLnuZjwJn4vCt+fTQoXMyC6WiMc+V/5gN8fOOGhiItw
   g9MzuyhyUXGqmS/UIOjN2+gmO9y0HsFb1qxb1YcrQf+dTWnkn0P8DMR6v
   rJszz7IG0qyMHejHh7ztXhjj8coONmbITUV0edlNwqRcOj3T4BopMmISR
   dNh3NVwn5ELLuts7s5Ary8ed/2QfhOilY6mrDS/DQcLvoNby3LbVGH2It
   UQCczKUof/ozDFJK1md9g+oDd5Phst0b3jsFWJCITgOGf9RqEA8n1F+mc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="374154057"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="374154057"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 01:39:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="698567227"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="698567227"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.240]) ([10.254.215.240])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 01:39:15 -0700
Subject: Re: [PATCH 3/4] scsi: bfa: Convert bfad_reset_sdev_bflags() from a
 macro into a function
To: Bart Van Assche <bvanassche@acm.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20221031224728.2607760-4-bvanassche@acm.org>
 <202211040328.Rq54Vqux-lkp@intel.com>
 <637d0840-5246-a71d-3fa6-ed27eda7a266@acm.org>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <fc6f5c8a-4a67-24dd-7394-9a167b182c52@intel.com>
Date: Fri, 4 Nov 2022 16:39:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <637d0840-5246-a71d-3fa6-ed27eda7a266@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/4/2022 3:49 AM, Bart Van Assche wrote:
> On 11/3/22 12:33, kernel test robot wrote:
>> sparse warnings: (new ones prefixed by >>)
>>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2391:25: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2414:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2415:38: sparse: sparse: cast to 
>> restricted __be16
>>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to 
>> restricted __be32
>>     drivers/scsi/bfa/bfad_bsg.c:2417:33: sparse: sparse: cast to 
>> restricted __be32
>>>> drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse: sparse: incorrect type 
>>>> in initializer (different base types) @@     expected unsigned int 
>>>> const [usertype] scan_flags @@     got restricted blist_flags_t @@
>>     drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse:     expected unsigned 
>> int const [usertype] scan_flags
>>     drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse:     got restricted 
>> blist_flags_t
>>     drivers/scsi/bfa/bfad_bsg.c:2562:51: sparse: sparse: invalid 
>> assignment: |=
>>     drivers/scsi/bfa/bfad_bsg.c:2562:51: sparse:    left side has type 
>> restricted blist_flags_t
>>     drivers/scsi/bfa/bfad_bsg.c:2562:51: sparse:    right side has 
>> type unsigned int
>>     drivers/scsi/bfa/bfad_bsg.c:2564:51: sparse: sparse: invalid 
>> assignment: &=
>>     drivers/scsi/bfa/bfad_bsg.c:2564:51: sparse:    left side has type 
>> restricted blist_flags_t
>>     drivers/scsi/bfa/bfad_bsg.c:2564:51: sparse:    right side has 
>> type unsigned int
>>     drivers/scsi/bfa/bfad_bsg.c:3407:34: sparse: sparse: incorrect 
>> type in argument 2 (different address spaces) @@     expected void 
>> const [noderef] __user *from @@     got void * @@
>>     drivers/scsi/bfa/bfad_bsg.c:3407:34: sparse:     expected void 
>> const [noderef] __user *from
>>     drivers/scsi/bfa/bfad_bsg.c:3407:34: sparse:     got void *
>>     drivers/scsi/bfa/bfad_bsg.c:3561:27: sparse: sparse: incorrect 
>> type in argument 1 (different address spaces) @@     expected void 
>> [noderef] __user *to @@     got void * @@
>>     drivers/scsi/bfa/bfad_bsg.c:3561:27: sparse:     expected void 
>> [noderef] __user *to
>>     drivers/scsi/bfa/bfad_bsg.c:3561:27: sparse:     got void *
> 
> Dear kernel robot,
> 
> Thank you for having reported this. However, I do not agree that these 
> sparse warnings are new. My hope is that a human maintainer of the 
> kernel robot will read this message and will improve the kernel robot.
> 
> Bart.
> 

Hi Bart,

Sorry for the inconvience, you are right, the sparse warning is not new,
the bot noticed a little change of below warning:

on parent commit:
../drivers/scsi/bfa/bfad_bsg.c:2551:9: sparse: warning: incorrect type 
in initializer (different base types)
../drivers/scsi/bfa/bfad_bsg.c:2551:9: sparse:    expected unsigned int 
[usertype] scan_flags
../drivers/scsi/bfa/bfad_bsg.c:2551:9: sparse:    got restricted 
blist_flags_t

on current commit:
../drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse: warning: incorrect type 
in initializer (different base types)
../drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse:    expected unsigned int 
const [usertype] scan_flags
../drivers/scsi/bfa/bfad_bsg.c:2553:50: sparse:    got restricted 
blist_flags_t

we'll take a look to avoid reporting such case.

Best Regards,
Rong Chen
