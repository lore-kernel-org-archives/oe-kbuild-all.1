Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2512F31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668507353; x=1700043353;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4uAJpOIG4I1tmYqd8L8zy9c3xHeHAX640tgSLalwAMM=;
  b=n1OXw56RvH7SVqxizBv53EWZApb7uQK/PvLvG2GJmx0fnINRCIwvyX52
   rzxc+mAnNVexJkGpwswwBsSG8fYg292kTLjY2EsjT4pFFfyoqXZOEXHT1
   x5VShPh7g1OdYHQNEXpyO4YhDzN8ZZukasIdWqMLm0BYr5AyV2KF7aqa9
   3nf8qrtQ+9LaA7WjYFbGY74XdLCOfz45wluDKxVT6u40mm9N321/Wyla9
   M+YTIhY+Xt1kyMjood3iTLLUSt6oD9WeJXo0Y3sRTx2WJ/EKIoED1i2Ac
   7hzXKYJBMgzY/KRn8quIlG8vdqlgvwJvT62SuZPHl8IJMWeoSyvwIMYrL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="339013438"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="339013438"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 02:15:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="727898941"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="727898941"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.213.226]) ([10.254.213.226])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 02:15:50 -0800
Subject: Re: [linux-stable-rc:queue/4.9 28/28] depmod: WARNING: could not open
 modules.builtin.modinfo at
 /tmp/kernel/i386-randconfig-a003-20221114/gcc-7/46a89225a27e8c41414eb8278883f515ba7085c8/lib/modules/4.9.333-00028-g46a89225a27e:
 No such file or directory
To: Tudor.Ambarus@microchip.com, lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev, sashal@kernel.org, vkoul@kernel.org,
 gregkh@linuxfoundation.org
References: <202211150709.X8q5MX46-lkp@intel.com>
 <1ac54508-3253-66fe-5932-27548c8ba8a2@microchip.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <f0ed276a-af09-30d0-e0e6-32cccf6d28f2@intel.com>
Date: Tue, 15 Nov 2022 18:15:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1ac54508-3253-66fe-5932-27548c8ba8a2@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/15/2022 3:05 PM, Tudor.Ambarus@microchip.com wrote:
> On 11/15/22 01:42, kernel test robot wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.9
>> head:   46a89225a27e8c41414eb8278883f515ba7085c8
>> commit: 46a89225a27e8c41414eb8278883f515ba7085c8 [28/28] dmaengine: at_hdmac: Check return code of dma_async_device_register
>> config: i386-randconfig-a003-20221114
>> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>> reproduce (this is a W=1 build):
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=46a89225a27e8c41414eb8278883f515ba7085c8
>>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>          git fetch --no-tags linux-stable-rc queue/4.9
>>          git checkout 46a89225a27e8c41414eb8278883f515ba7085c8
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          make W=1 O=build_dir ARCH=i386 modules_install
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> depmod: WARNING: could not open modules.builtin.modinfo at /tmp/kernel/i386-randconfig-a003-20221114/gcc-7/46a89225a27e8c41414eb8278883f515ba7085c8/lib/modules/4.9.333-00028-g46a89225a27e: No such file or directory
> 
> The warning does not seem related to the blamed commit.
> 

Hi Tudor,

Sorry for the inconvenience, it's a false positive,
please ignore this report.

Best Regards,
Rong Chen
