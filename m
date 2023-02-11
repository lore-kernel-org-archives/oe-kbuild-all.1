Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF51146BB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 15:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1676130503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e/zPYPpfYz7wubJCCx0CrEQWRs3a5ZSMO/Um67003R/9iyKTWuXzAc91qzYLVMbfCdvxTPAUdJEwOaxz1mMdXGTau3vC8dPFN3VrY2ENQvY8zD7UiPDyHprwXM3HZqpf/ZnRKiahD6LOPgE432GXgb+IfiVL4SRJ99pxydIHCkk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1676130503; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=T5ZNDji1BGUddkTnFhl2Fn/fQKG//B4vh53JrWFA4sk=; 
	b=hMbmXYY7UKvFJichQmMI1XcokK8ts3WE3GXV/pXxnrUSdHtb4i7Ww2T/6whEg+cXNY47/22HAXnDgLSsDrdtoJV3pv10oDbkh0+A31A2nX4Cv3cqIIDXnEWJQA7pqH+NBVNq8631Yc7BR2u2XilQ3TkzrJqwDdreX8LhPYzjbvQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1676130503;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T5ZNDji1BGUddkTnFhl2Fn/fQKG//B4vh53JrWFA4sk=;
	b=OJiELv6sDPgjspOubfMLtpBK2qUzC7yqLJ0V6inrHXQjGetUHzYEwHzibT3mm25k
	LINdrTbOazPYxNaQmHFzu25pPnlZ5kQvEumqQ6xRK743qkm+6xYtwROA3JFga/03kHD
	+SHuKHCBzFIcyn3GWFw4YGoVTdoaHqanBsvNhZnc=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1676130502381880.6708691686807; Sat, 11 Feb 2023 07:48:22 -0800 (PST)
Message-ID: <5c074b29-dccf-7de3-06e1-d02aa0b75bb0@arinc9.com>
Date: Sat, 11 Feb 2023 18:48:19 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [stable:linux-5.15.y 1091/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sasha Levin <sashal@kernel.org>
References: <202302111929.p1VomUPI-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <202302111929.p1VomUPI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This issue is actually fixed but, for some reason, the robot checks out 
the tree with the issue existing instead of the current head of the 
tree. It may be because the reported-by and the link tags weren't there 
on the backported commit that fixed the issue.

Unrelated to this report, I see we need to take another upstream commit 
to 5.15 for gbpc1.dts to compile properly. I'll send a mail to the 
stable mailing list.

Arınç

On 11.02.2023 15:03, kernel test robot wrote:
> Hi Arınç,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   85d7786c66b69d3f07cc149ac2f78d8f330c7c11
> commit: 127a5d3e732df7d7fb5bdbbaca3acdd679003605 [1091/9999] staging: mt7621-dts: fix GB-PC2 devicetree
> config: mips-randconfig-r005-20221117 (https://download.01.org/0day-ci/archive/20230211/202302111929.p1VomUPI-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=127a5d3e732df7d7fb5bdbbaca3acdd679003605
>          git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>          git fetch --no-tags stable linux-5.15.y
>          git checkout 127a5d3e732df7d7fb5bdbbaca3acdd679003605
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302111929.p1VomUPI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/staging/mt7621-dts/gbpc2.dts:22.28-26.4: ERROR (duplicate_label): /palmbus@1e000000: Duplicate label 'palmbus' on /palmbus@1e000000 and /palmbus@1E000000
>>> ERROR: Input tree has errors, aborting (use -f to force output)
> 
