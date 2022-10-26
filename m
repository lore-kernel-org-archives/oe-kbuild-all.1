Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE0210FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Oct 2022 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666778030; x=1698314030;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OvXW4JKxERS8HcyQ7C3C6Chfj8lRmUDFwe++uJUOJCA=;
  b=YZpneAS9c0wNrf5rfULWqEVtSAiILkzH2F87Q+pv8y8XIL99tVPyJXRB
   nK9Px4mi/+o9cZf3FHtHjsuQ+FXGTNDizn4DohTVhVLKEXHbVFpKYYPnD
   xsNDLldOmVBZjf8awFQVHmE5nzx0gmlMensQxGdQtWh2OpVLs4ALXa+BF
   23W4utfJtqHXIIxrBsOU7W+0Izo20cVtR4Nuu1GDmXEiG3vbgbbzfVtAn
   USlogXLw036WGBVuFPcOQhte0T6wOdQDTbD0i1EKKIkBkGnKgDYX6V/F+
   +exrRspPn1Y9xdyA0pvTleFiSBLpci5Qu5A9IGKUoeBpS3lP5gS3QwgmE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="305520633"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="305520633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 02:53:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="609892977"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="609892977"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.209.199]) ([10.254.209.199])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 02:53:48 -0700
Subject: Re: [peterz-queue:sched/core] BUILD SUCCESS
 7005e3c43be6b6297440e85cb7d8c12a94540b49
To: Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <6358f03b.p+cE2UomHFwpKwmv%lkp@intel.com>
 <Y1j/casy3VGtu3yJ@hirez.programming.kicks-ass.net>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <2d33ef0a-cb65-aaf1-1a9f-75237151c9ac@intel.com>
Date: Wed, 26 Oct 2022 17:53:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y1j/casy3VGtu3yJ@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/26/2022 5:35 PM, Peter Zijlstra wrote:
> On Wed, Oct 26, 2022 at 04:30:51PM +0800, kernel test robot wrote:
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
>> branch HEAD: 7005e3c43be6b6297440e85cb7d8c12a94540b49  psi: Fix possible missing or delayed pending event
>>
> 
> Robot guys; this is wrong...

Hi Peter,

Sorry for the inconvenience, we updated our mailing list to 
oe-kbuild-all@lists.linux.dev recently, but the service to count the 
errors wasn't
updated in time which causes we missed the below error.

Best Regards,
Rong Chen

> 
> See:
> 
>   https://lkml.kernel.org/r/202210260945.cCKjgJe3-lkp@intel.com
> 
> WTF are you reporting this branch as 'SUCCESS'. You cannot, must not,
> report a branch with build errors as SUCCESS, ever.
> 
