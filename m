Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A01F958
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="LMArisdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1698413831;
	bh=28NjKPHkc6iWXXkUJdRWK5+lOqix6lmTkDmIto4I9Mg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMArisduDINfE+8pBMMQO8Z2SpIbXEtQp4Vku5vBl3YG32y3F/pJEIkMMc3xZZGai
	 c283beYKAZOejE43c8x3HcUzOF8PKPjxx3yCZCrjoAcgQEroYAzM4bfxSTkE+mJ7Ar
	 YqsZMwcHAqz+E4JQt4KzTDdNzXcICxgTXK6iI8GQfdM3bMEejfk/R7OgbCSJjEKVMa
	 rHljHlwgHRGVx62txkGCTm7+PeoqwWMpUVJS8z1R7+mcO0K7aRPn9SNuwMpICbNycp
	 9fXrE2BWVRbzG8tXvA9vD+yGonbBooTdQQxSLT6tLfIJ7d/mnu2Py8zw3cOegEABZ1
	 IxvRB02m62ugA==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4SH3cR0688z1ZXX;
	Fri, 27 Oct 2023 09:37:10 -0400 (EDT)
Message-ID: <81d2fd04-572d-48cd-bb5c-9a77937a79a0@efficios.com>
Date: Fri, 27 Oct 2023 09:37:26 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix: rseq uapi: Adapt header includes to follow glibc
 header changes
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rik van Riel <riel@surriel.com>
References: <20231025214811.2066376-1-mathieu.desnoyers@efficios.com>
 <202310271556.LunB8KLv-lkp@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <202310271556.LunB8KLv-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-27 03:53, kernel test robot wrote:
> Hi Mathieu,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.6-rc7 next-20231026]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

The test robot complains about using <asm/types.h> in uapi headers for 
!__KERNEL__ case.

Steven, was there something wrong with including linux/types.h in uapi 
headers ?

Thanks,

Mathieu

> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/Fix-rseq-uapi-Adapt-header-includes-to-follow-glibc-header-changes/20231026-054939
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20231025214811.2066376-1-mathieu.desnoyers%40efficios.com
> patch subject: [PATCH] Fix: rseq uapi: Adapt header includes to follow glibc header changes
> config: i386-randconfig-001-20231026 (https://download.01.org/0day-ci/archive/20231027/202310271556.LunB8KLv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271556.LunB8KLv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310271556.LunB8KLv-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> usr/include/linux/rseq.h:14: include of <linux/types.h> is preferred over <asm/types.h>
>>> usr/include/linux/rseq.h:47: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

