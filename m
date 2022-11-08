Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC317ED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667870421; x=1699406421;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Ovy4Oove24HV51tBDDAcU6YaVAM8szzW+QrPvkFp6Uk=;
  b=CfZhRSdq6m7VLm9SYoPIks2vAl7VzXCCntyCcccZKW4Se8iTYAnosB+D
   O+SNZ1+zvyVb8nK9OlayLT4BB5AJVMBDYLbCrLKH1WuCOQZbAsOTewFPe
   MhhcswFaIa0Br6nwOp2/ycuB4C/2WpMlrpJlGVagAQkYsFGG3K34TfJWe
   Ad7OQB7F6qQP5LKdiiKO0s0Ayxo0BwSJVx8MnUYBFAeLNVNVe+bfUw4PH
   fT2ZoistzyjNv6jllBtjEq6dTnpyOa76KLP9SxGxtKWO0ZbWXCjpZiA7C
   HOOQdbQsRbe4wEfWwoWwbQcSV6eE22xD/FPYR3o7OlfyoIVB+8wSBG6SB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="372710249"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372710249"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 17:20:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699712707"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="699712707"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.214.53]) ([10.254.214.53])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 17:20:17 -0800
Subject: Re: [ammarfaizi2-block:stable/linux-stable-rc/queue/4.14 36/36]
 depmod: WARNING: could not open modules.builtin.modinfo at
 /tmp/kernel/x86_64-rhel-8.3-func/gcc-7/5cdc2b1e6f7258b38f0fb76a0858f310828024a7/lib/modules/4.14.298-00036-g5cdc2b1e6f72:
 No such file or directory
To: kernel test robot <lkp@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 Sasha Levin <sashal@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <202211080739.G9oxbZ8v-lkp@intel.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <b4d2cd9b-08e6-69a2-4305-d796e101d814@intel.com>
Date: Tue, 8 Nov 2022 09:20:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211080739.G9oxbZ8v-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 11/8/2022 7:44 AM, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/4.14
> head:   5cdc2b1e6f7258b38f0fb76a0858f310828024a7
> commit: 5cdc2b1e6f7258b38f0fb76a0858f310828024a7 [36/36] KVM: x86: emulator: update the emulation mode after CR0 write
> config: x86_64-rhel-8.3-func
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build):
>          # https://github.com/ammarfaizi2/linux-block/commit/5cdc2b1e6f7258b38f0fb76a0858f310828024a7
>          git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>          git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/4.14
>          git checkout 5cdc2b1e6f7258b38f0fb76a0858f310828024a7
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=x86_64 modules_install
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> depmod: WARNING: could not open modules.builtin.modinfo at /tmp/kernel/x86_64-rhel-8.3-func/gcc-7/5cdc2b1e6f7258b38f0fb76a0858f310828024a7/lib/modules/4.14.298-00036-g5cdc2b1e6f72: No such file or directory
> --
>>> depmod: WARNING: could not open modules.builtin.modinfo at /tmp/kernel/x86_64-rhel-8.3-func/gcc-7/5cdc2b1e6f7258b38f0fb76a0858f310828024a7/lib/modules/4.14.298-00036-g5cdc2b1e6f72: No such file or directory
> 

Sorry for the noise, it's a false positive related to the test environment.

Best Regards,
Rong Chen
