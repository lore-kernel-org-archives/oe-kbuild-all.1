Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B810FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667556182; x=1699092182;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=g+1FU1UbK9Z2VGaBVxEvU818H48PEczmtH1jj6hXGXA=;
  b=luwn85YUPInEEi5S9NqXuIdJq39AJGBhvHCQXEHJpdO2Mj36v2Y5jbep
   YMPcmI5hn0j/BQLRfgzJrjmPLoiN3mSF3CT91b2xqnS2te2cLB09A71a3
   JxJ4/4fYGUlSga0+XeoLyezW1tmjNMahrODLYmYVLrY+KSwLAMuPS65GK
   ZfNWtJNmjaJxckZFhGICoUZ0ciR7zQ+mUBjVsq68tbKXdSRHyrFW5dXFm
   n2/nCuIM167BK1yunhN+eCccA6PS8Z3JAxxgLUQ+uVi6yv+0tCNP/c1CZ
   PvV7R3HvpI3pNcS1GxjIk2fB6x/fci1KkJSxQWJetrsAQD07LjVhsAYtH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="289648554"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="289648554"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 03:03:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="740568617"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="740568617"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.240]) ([10.254.215.240])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 03:02:58 -0700
Subject: Re: [PATCH] ceph: fix memory leak in mount error path when using
 test_dummy_encryption
To: =?UTF-8?Q?Lu=c3=ads_Henriques?= <lhenriques@suse.de>,
 kernel test robot <lkp@intel.com>
Cc: Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, oe-kbuild-all@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221103153619.11068-1-lhenriques@suse.de>
 <202211042241.mPJd6rKy-lkp@intel.com> <Y2TflzMdeiXRMoek@suse.de>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <fc1fee1f-c6f0-9366-8759-f80b9ba532e7@intel.com>
Date: Fri, 4 Nov 2022 18:02:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y2TflzMdeiXRMoek@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/4/2022 5:47 PM, Luís Henriques wrote:
> On Fri, Nov 04, 2022 at 02:40:25PM +0800, kernel test robot wrote:
>> Hi Luís,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on ceph-client/for-linus]
>> [also build test ERROR on linus/master v6.1-rc3 next-20221104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/ceph-fix-memory-leak-in-mount-error-path-when-using-test_dummy_encryption/20221103-233629
>> base:   https://github.com/ceph/ceph-client.git for-linus
> 
> Well, thank you very much!  Now, how do I tell this bot that this patch
> isn't targeting this branch?

Hi Luis,

The below message may help:

 >> [If your patch is applied to the wrong git tree, kindly drop us a note.
 >> And when submitting patch, we suggest to use '--base' as documented in
 >> https://git-scm.com/docs/git-format-patch#_base_tree_information]

we also appreciate that if developers can tell us the right branch
to improve the bot when applied to wrong place.

Best Regards,
Rong Chen

> 
> Cheers,
> --
> Luís
> 
