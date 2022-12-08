Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80636F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Dec 2022 06:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670481475; x=1702017475;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ShT+ZD6fVU/pCoOfY8/3F97mt4AfaTyb9fhvY7J7pvU=;
  b=eCMel9/mTNYlqtCxwFkf/GRj+PwO8GWKxFDecnDC13jDwUW+IZp4FOQn
   uHC8nYdKt8lFnLMGHkw1eHvWhVH2O0WpUm+fjzdKoi9ufc+/OFuRXXT12
   xpXIiuK4tKalBneGMQvczGaolxASbE6gAEuJzxl3YecJbN8xm5y9P9P9M
   ET/l6TaYr51n4d3LB6PFMN3sQQdes40AYLtJ54SxVL/yOgI1+9jUX7zDF
   oMbq/ovf9hxLsVxAsh5nRj8IujqrYwhOSXNbHb2jTdSVmbKQmHYvW1R7P
   CZbvC+brx8re+fjnAeEe/vlSAvwAL/5BqxK6hFSD7CvYv0d4m2h1+SoMZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="318942207"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="318942207"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 22:37:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="753428003"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="753428003"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.59]) ([10.254.215.59])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 22:37:47 -0800
Subject: Re: lib/crypto/blake2s-selftest.c:632:1: warning: the frame size of
 1120 bytes is larger than 1024 bytes
To: Herbert Xu <herbert@gondor.apana.org.au>,
 kernel test robot <lkp@intel.com>
Cc: "Jason A. Donenfeld" <zx2c4@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
References: <202211072109.qvrnjNKo-lkp@intel.com>
 <Y5Flnb8jadyDebx3@gondor.apana.org.au>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <d25ac395-4335-be88-9dc5-364f5715554f@intel.com>
Date: Thu, 8 Dec 2022 14:37:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y5Flnb8jadyDebx3@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/8/2022 12:18 PM, Herbert Xu wrote:
> On Mon, Nov 07, 2022 at 09:18:05PM +0800, kernel test robot wrote:
>> Hi Jason,
>>
>> FYI, the error/warning still remains.
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   f0c4d9fc9cc9462659728d168387191387e903cc
>> commit: 2d16803c562ecc644803d42ba98a8e0aef9c014e crypto: blake2s - remove shash module
>> date:   5 months ago
>> config: i386-buildonly-randconfig-r006-20221107
>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>> reproduce (this is a W=1 build):
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2d16803c562ecc644803d42ba98a8e0aef9c014e
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout 2d16803c562ecc644803d42ba98a8e0aef9c014e
> 
> This was fixed months ago with
> 
> commit d6c14da474bf260d73953fbf7992c98d9112aec7
> Author: Jason A. Donenfeld <Jason@zx2c4.com>
> Date:   Mon Jun 20 09:52:43 2022 +0200
> 
>      crypto: lib/blake2s - reduce stack frame usage in self test
> 
> Why is LKP still testing the old commit?

Hi Herbert,

Thanks for the information, I checked the result of the fix commit,
it reduced the stack frame but the warning still exists:

lib/crypto/blake2s-selftest.c:632:1: warning: the frame size of 1056 
bytes is larger than 1024 bytes [-Wframe-larger-than=]

We'll ignore commit 2d16803c56 to avoid reporting it again.

Best Regards,
Rong Chen


> 
> Cheers,
> 
