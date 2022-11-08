Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517E17ED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 01:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667870433; x=1699406433;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3YpeWdh4y8oR5/yTGnVql9Fw7h4QU3xAllwRr40dITY=;
  b=lBZFHoibADeoDCLPvxyaUJjzSLinPMhkVVAG5eo4yfOmDSwY8nu2zmyv
   fgRW5PSe0OjnGaI/B71sIAZT509BEP/lCCLQxMIHE7nWM/+Rg5tMbutKh
   j8CKFzrsFAelipRbIdzg6wMGrFzZqYD3fZulYUrFCypXC6AgCyASonJ5E
   0NosA3T/hra0TgaKfZhFYVvK0lCzspzn2aOBySzg4eOqcyuc2Mn39IJfv
   TkKdPwFvFdeYb9UVbIInxIIkLzQVNtjZiWI63gGB1RI0UTS5wOUY6Rk2+
   VkRRhRwVQs5uqzD6C/L0m8W6+VnGteZZriJPkrm8FAHBV81T4CbSSMIUa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374841947"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="374841947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 17:20:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699712790"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="699712790"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.214.53]) ([10.254.214.53])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 17:20:30 -0800
Subject: Re: [ammarfaizi2-block:stable/linux-stable-rc/queue/4.9 29/29]
 depmod: WARNING: could not open modules.builtin.modinfo at
 /tmp/kernel/x86_64-rhel-8.3-func/gcc-7/763aa038614c12f085f63bc38c77d333d1de18e5/lib/modules/4.9.332-00029-g763aa038614c:
 No such file or directory
To: kernel test robot <lkp@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 Sasha Levin <sashal@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <202211080835.z4aTbNmh-lkp@intel.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <9c6661ba-3bf7-a6f6-496a-b647187594fb@intel.com>
Date: Tue, 8 Nov 2022 09:20:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211080835.z4aTbNmh-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/8/2022 8:55 AM, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/4.9
> head:   763aa038614c12f085f63bc38c77d333d1de18e5
> commit: 763aa038614c12f085f63bc38c77d333d1de18e5 [29/29] KVM: x86: emulator: update the emulation mode after CR0 write
> config: x86_64-rhel-8.3-func
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build):
>          # https://github.com/ammarfaizi2/linux-block/commit/763aa038614c12f085f63bc38c77d333d1de18e5
>          git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>          git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/4.9
>          git checkout 763aa038614c12f085f63bc38c77d333d1de18e5
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=x86_64 modules_install
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> depmod: WARNING: could not open modules.builtin.modinfo at /tmp/kernel/x86_64-rhel-8.3-func/gcc-7/763aa038614c12f085f63bc38c77d333d1de18e5/lib/modules/4.9.332-00029-g763aa038614c: No such file or directory
> 

Sorry for the noise, it's a false positive related to the test environment.

Best Regards,
Rong Chen
