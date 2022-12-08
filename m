Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DE657
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Dec 2022 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670483188; x=1702019188;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=MazzARJ0TDY2vqbGWOp0+Y8XRTB/z8nD9pxfSFQRlWE=;
  b=N3fcgzq1F4cH+jvlOs8yxv+Hr0ks9vABZMonwd1MYdsfWTH79g0mug+L
   lJQ2Rlhavw/ynelvG9bo7IRcSvdI0hkBrWPEfL8O5CIcx19xi3lp8mAxP
   XvyF0/JX3bDgBsRxp+4+ejq102s2TZQGQbo7Hxt/ZVMm3VF1FjU5hywX0
   WJIWpO5CmupdaLLyufdSvCf2ZIjvyHqN6Ya4fZWGM36y4zwkEbqch5zbc
   r6IpKumhftPLA/8YjOFV3O+Y90e3VZ3PJYPkfD73NflND4bx+0aY8GhlX
   0RnP3omnZh/CMCgrACI9n3+hOTz26ca+asBPnCU06RT4RfT88cmf93fHC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="300510665"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="300510665"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 23:04:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="821232154"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="821232154"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.59]) ([10.254.215.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 23:04:55 -0800
Subject: Re: [linux-next:master 11969/13282] drivers/net/thunderbolt.c:733:47:
 sparse: sparse: restricted __le32 degrades to integer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202212061455.6GE7y0jg-lkp@intel.com>
 <Y49apAPQ/xvoqpXl@smile.fi.intel.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <d70e9a74-e965-b21b-9c58-eef4029e247a@intel.com>
Date: Thu, 8 Dec 2022 15:04:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y49apAPQ/xvoqpXl@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/6/2022 11:07 PM, Andy Shevchenko wrote:
> On Tue, Dec 06, 2022 at 02:40:16PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   5d562c48a21eeb029a8fd3f18e1b31fd83660474
>> commit: a479f9264bddfd0c266615b83f784222eccf9b91 [11969/13282] net: thunderbolt: Use bitwise types in the struct thunderbolt_ip_frame_header
>> config: openrisc-randconfig-s041-20221205
>> compiler: or1k-linux-gcc (GCC) 12.1.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.4-39-gce1a6720-dirty
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a479f9264bddfd0c266615b83f784222eccf9b91
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout a479f9264bddfd0c266615b83f784222eccf9b91
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/ drivers/nvme/target/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
> 
> Yes, it's expected. The change flip-flopped the warnings. As a result the
> amount of warnings has been reduced from 17 to 9.

Hi Andy,

Sorry for the inconvenience, we'll add it to our ignore list.

Best Regards,
Rong Chen

> 
> (wsum warning is not counted in the above statistics)
> 
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades to integer
>>>> drivers/net/thunderbolt.c:741:47: sparse: sparse: restricted __le16 degrades to integer
>>     drivers/net/thunderbolt.c:742:44: sparse: sparse: restricted __le16 degrades to integer
>>>> drivers/net/thunderbolt.c:838:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_size @@     got unsigned int [assigned] [usertype] frame_size @@
>>     drivers/net/thunderbolt.c:838:40: sparse:     expected restricted __le32 [usertype] frame_size
>>     drivers/net/thunderbolt.c:838:40: sparse:     got unsigned int [assigned] [usertype] frame_size
>>>> drivers/net/thunderbolt.c:839:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_count @@     got unsigned int [usertype] @@
>>     drivers/net/thunderbolt.c:839:41: sparse:     expected restricted __le32 [usertype] frame_count
>>     drivers/net/thunderbolt.c:839:41: sparse:     got unsigned int [usertype]
>>>> drivers/net/thunderbolt.c:840:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_index @@     got unsigned short [usertype] @@
>>     drivers/net/thunderbolt.c:840:41: sparse:     expected restricted __le16 [usertype] frame_index
>>     drivers/net/thunderbolt.c:840:41: sparse:     got unsigned short [usertype]
>>>> drivers/net/thunderbolt.c:841:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_id @@     got unsigned short [usertype] @@
>>     drivers/net/thunderbolt.c:841:38: sparse:     expected restricted __le16 [usertype] frame_id
>>     drivers/net/thunderbolt.c:841:38: sparse:     got unsigned short [usertype]
>>     drivers/net/thunderbolt.c:842:62: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/net/thunderbolt.c:842:35: sparse: sparse: restricted __le16 degrades to integer
>>     drivers/net/thunderbolt.c:953:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __wsum [usertype] wsum @@     got restricted __be32 [usertype] @@
>>     drivers/net/thunderbolt.c:953:23: sparse:     expected restricted __wsum [usertype] wsum
>>     drivers/net/thunderbolt.c:953:23: sparse:     got restricted __be32 [usertype]
> 
