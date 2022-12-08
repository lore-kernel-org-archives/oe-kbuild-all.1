Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4957F3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Dec 2022 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670490295; x=1702026295;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=a6vkwZSA6/oadYV/o3Z42RiyjF6U3/79UY6HJ4cesJ4=;
  b=Q+OaOdOw2QShWP9mjZtFJjUB+hN91FEQcnCwQpHvGlxVUYrUKLEmHlNp
   7rKG/d7QyB+/2uxr1xcF3TChpHILz+b+WU8m8LosPpMlNGR7QOxBVT9/S
   czqcXSTnj2TOVFQiDq1kGlkepfBVYFmWa9Nk1soKTY8fUlxLCAgyyClCF
   WuZ5nw1GJrF5BezCmHO4Qb2gtiLBS3JplYvYJNb4jET42pcnegMHK6gHS
   QbMjOSZQGWp5FihBxUoE8pKB7d1If9lm4mR7lKwTnJrOs+4E5zT03gkB3
   5OWOtQo/oazObxdhbJBp9dNOPij7uZWdiikmw/PVxfDoQzdyo1tNGw8de
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="314769271"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="314769271"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 01:03:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="597276816"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="597276816"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.59]) ([10.254.215.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 01:03:19 -0800
Subject: Re: [linux-next:master 11969/13282] drivers/net/thunderbolt.c:733:47:
 sparse: sparse: restricted __le32 degrades to integer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202212061455.6GE7y0jg-lkp@intel.com>
 <Y49apAPQ/xvoqpXl@smile.fi.intel.com>
 <d70e9a74-e965-b21b-9c58-eef4029e247a@intel.com>
 <Y5GkipQqVz9WVGtq@smile.fi.intel.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <814dd916-42dc-a6c2-37d6-dc5227cdfc5a@intel.com>
Date: Thu, 8 Dec 2022 17:03:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y5GkipQqVz9WVGtq@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/8/2022 4:47 PM, Andy Shevchenko wrote:
> On Thu, Dec 08, 2022 at 03:04:52PM +0800, Chen, Rong A wrote:
>> On 12/6/2022 11:07 PM, Andy Shevchenko wrote:
>>> On Tue, Dec 06, 2022 at 02:40:16PM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>> head:   5d562c48a21eeb029a8fd3f18e1b31fd83660474
>>>> commit: a479f9264bddfd0c266615b83f784222eccf9b91 [11969/13282] net: thunderbolt: Use bitwise types in the struct thunderbolt_ip_frame_header
>>>> config: openrisc-randconfig-s041-20221205
>>>> compiler: or1k-linux-gcc (GCC) 12.1.0
>>>> reproduce:
>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # apt-get install sparse
>>>>           # sparse version: v0.6.4-39-gce1a6720-dirty
>>>>           # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a479f9264bddfd0c266615b83f784222eccf9b91
>>>>           git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>>>           git fetch --no-tags linux-next master
>>>>           git checkout a479f9264bddfd0c266615b83f784222eccf9b91
>>>>           # save the config file
>>>>           mkdir build_dir && cp config build_dir/.config
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/ drivers/nvme/target/
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> Yes, it's expected. The change flip-flopped the warnings. As a result the
>>> amount of warnings has been reduced from 17 to 9.
>>
>> Hi Andy,
>>
>> Sorry for the inconvenience, we'll add it to our ignore list.
> 
> Ideally you should have compared the warnings before and after the change and
> tell something like warnings number dropped or increased to N (arbitrary
> number, should be real one based on the parser's output) and leave new warnings
> to be produced.

Hi Andy,

Thanks for your advice, We have similar logic under internal reviewing 
to avoid such false positive.

Best Regards,
Rong Chen


> 
>>> (wsum warning is not counted in the above statistics)
> 
> And this warning is still in place, so it shouldn't be reflected in the
> statistics.
> 
>>>> sparse warnings: (new ones prefixed by >>)
>>>>>> drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades to integer
>>>>>> drivers/net/thunderbolt.c:741:47: sparse: sparse: restricted __le16 degrades to integer
>>>>      drivers/net/thunderbolt.c:742:44: sparse: sparse: restricted __le16 degrades to integer
>>>>>> drivers/net/thunderbolt.c:838:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_size @@     got unsigned int [assigned] [usertype] frame_size @@
>>>>      drivers/net/thunderbolt.c:838:40: sparse:     expected restricted __le32 [usertype] frame_size
>>>>      drivers/net/thunderbolt.c:838:40: sparse:     got unsigned int [assigned] [usertype] frame_size
>>>>>> drivers/net/thunderbolt.c:839:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_count @@     got unsigned int [usertype] @@
>>>>      drivers/net/thunderbolt.c:839:41: sparse:     expected restricted __le32 [usertype] frame_count
>>>>      drivers/net/thunderbolt.c:839:41: sparse:     got unsigned int [usertype]
>>>>>> drivers/net/thunderbolt.c:840:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_index @@     got unsigned short [usertype] @@
>>>>      drivers/net/thunderbolt.c:840:41: sparse:     expected restricted __le16 [usertype] frame_index
>>>>      drivers/net/thunderbolt.c:840:41: sparse:     got unsigned short [usertype]
>>>>>> drivers/net/thunderbolt.c:841:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_id @@     got unsigned short [usertype] @@
>>>>      drivers/net/thunderbolt.c:841:38: sparse:     expected restricted __le16 [usertype] frame_id
>>>>      drivers/net/thunderbolt.c:841:38: sparse:     got unsigned short [usertype]
>>>>      drivers/net/thunderbolt.c:842:62: sparse: sparse: restricted __le32 degrades to integer
>>>>      drivers/net/thunderbolt.c:842:35: sparse: sparse: restricted __le16 degrades to integer
>>>>      drivers/net/thunderbolt.c:953:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __wsum [usertype] wsum @@     got restricted __be32 [usertype] @@
>>>>      drivers/net/thunderbolt.c:953:23: sparse:     expected restricted __wsum [usertype] wsum
>>>>      drivers/net/thunderbolt.c:953:23: sparse:     got restricted __be32 [usertype]
>>>
> 
