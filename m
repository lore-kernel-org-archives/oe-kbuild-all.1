Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4C28E7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Nov 2022 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667980642; x=1699516642;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=b11OAt7034UMeGrgRP/0loZ9GIxLTwxteVa4x5MZM5k=;
  b=MP3GGGJyDmDLc5qqrbu/MRQibJVn/UvjCU4gY9jpwnTTEwU++rU/aCab
   XoHUgEzTarXQvPu4qAQHMnsyDx1Ztk5jXOuxypJUQQ8g2V2iYMnUMZGvp
   0mAASSSn8ib2nSX8KrpnDslx0bIfrt8BVbJAlwEwVnJD3t5Ha+sEmICca
   zy7m6ecPDMSwV17bY+665OEXHh6fmEuZm8fo5AyWHTHLcoPog0wVxh/Fz
   3kRk1OqX9EIr5D+tu4qv1ggu4XSKR0247MQiDn4QrKrROOoy7OTvk+jxw
   +QjG1/0ofueuZiKMHJJhRmpwhzRthypEUjz7ymPmEPZthm7/TaVyXOF7k
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="298437537"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="298437537"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 23:57:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="639110158"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="639110158"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.214.171]) ([10.254.214.171])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 23:57:19 -0800
Subject: Re: drivers/remoteproc/st_remoteproc.c:114:20: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Russell King <rmk+kernel@armlinux.org.uk>
References: <202211091154.quYhgunB-lkp@intel.com>
 <5f51b4bd-3bc2-487b-aacd-9d0a1129c615@app.fastmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <1e65634e-9184-d93f-6477-bbe96193a5e3@intel.com>
Date: Wed, 9 Nov 2022 15:57:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5f51b4bd-3bc2-487b-aacd-9d0a1129c615@app.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/9/2022 3:33 PM, Arnd Bergmann wrote:
> On Wed, Nov 9, 2022, at 04:54, kernel test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> master
>> head:   f141df371335645ce29a87d9683a3f79fba7fd67
>> commit: d803336abdbc1bfacdb32b2cf9f4fdbee072b8ee ARM: mm: kill unused
>> runtime hook arch_iounmap()
> 
> Thanks for the report, but I think it might be better to stop
> reporting address space violations from this patch, because it
> only started showing existing known issues with a slightly
> different error message, or flagging issues on arm32 that
> were previously shown on other architectures.

Hi Arnd,

Thanks for your advice, we'll add the commit to ignore list.

Best Regards,
Rong Chen

> 
>> sparse warnings: (new ones prefixed by >>)
>>     drivers/remoteproc/st_remoteproc.c:98:12: sparse: sparse: incorrect
>> type in assignment (different address spaces) @@     expected void *va
>> @@     got void [noderef] __iomem * @@
>>     drivers/remoteproc/st_remoteproc.c:98:12: sparse:     expected void
>> *va
>>     drivers/remoteproc/st_remoteproc.c:98:12: sparse:     got void
>> [noderef] __iomem *
>>>> drivers/remoteproc/st_remoteproc.c:114:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *va @@
> 
>        Arnd
> 
