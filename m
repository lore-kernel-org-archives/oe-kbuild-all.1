Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA5310EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667550200; x=1699086200;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7Y+gkhAAp0u7K1e9Tn7vtLtpxEKEw1yXGZ/7gmkDqig=;
  b=ULMHGzmd/Y3WRCardh1tk9/QoYGkSVoHoSADlG6aoUp2HS86lu9tqcnz
   8QcnFociFIS0WAafGPRDg8+Yav1TJRxfWiWdTD135e75dBF3aDEhvzBYA
   FJWPfD0OcZHUHj8Ax1PvqLn1tq1pt+fvWG1iOQuGEnxv1qEmusm46I9Yi
   WbrUrdKcUsLXZ4uC++gLYU4tSAMt1Qpn/c30o8FYDb0Sbhz+zJ3gF+9ow
   LDSe+8LfWjsyiLmJJnPuJWOXHymjxbSpub8BYH2NxIV8NOQayZiroXsAR
   grm1IxThBq8Fko/DpXocX1FacQkrklhgEsYTVCbDKnJJio14C7Am4BFKM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="293238300"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="293238300"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 01:23:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="880214608"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="880214608"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.240]) ([10.254.215.240])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 01:23:03 -0700
Subject: Re: FAILED: load BTF from vmlinux: No such file or directory
To: Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <202211030542.t5oB7Bw6-lkp@intel.com>
 <Y2Lig+5ak3zKuPa1@sirena.org.uk>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <80c8a969-b88c-fec3-ac32-0a61295decd6@intel.com>
Date: Fri, 4 Nov 2022 16:23:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y2Lig+5ak3zKuPa1@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/3/2022 5:34 AM, Mark Brown wrote:
> On Thu, Nov 03, 2022 at 05:27:38AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   8e5423e991e8cd0988d0c4a3f4ac4ca1af7d148a
>> commit: 4e8ff35878685291978b93543d6b9e9290be770a ASoC: codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()
>> date:   2 weeks ago
>> config: arc-buildonly-randconfig-r004-20221103
>> compiler: arceb-elf-gcc (GCC) 12.1.0
> 
> ...
> 
>> All errors (new ones prefixed by >>):
>>
>>     Complex, interval and imaginary float types are not supported
>>     Encountered error while encoding BTF.
>>>> FAILED: load BTF from vmlinux: No such file or directory
> 
> This looks very much like a false positive, it is difficult to
> understand how a change such as the one identified could trigger such an
> issue.
> 

Hi Mark,

Sorry for the noise, it's a false positive, the commit here fixed a 
error and let the build process continuing which let the bot thought
the new error is from this commit.

Best Regards,
Rong Chen
