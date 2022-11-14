Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580782C9D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 22:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668466548; x=1700002548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=EZ/crrnadC6FZuL7yBtXGWmT4C8UtSxOOH2Ei2CQ/g8=;
  b=C+RhvfDE9PrdGibCs+5lX261yP6E4seqQBS/G1iGgBH7HE6puu7bDMhC
   edmDgtS93lAi+3cW/XcFbP9HQsEVX3ASCa2vaMbKbjS0PSw82jGZ50DV3
   abhfw+scxaqxIVpbqsVJW+w31gE3MH9G/RDEZyaAz+8X/Zur5eHn9wyZi
   pGY8S7s/f2OYkp03awLkVAdnCcNEPusB1TM3rfIOZdlQn8j8tqoQ3rMvA
   K9pas13zQWaS3ZK96gB74/HLOLKKwfYHTKkIOx3HAEfuk9Lk5c5RhaGn9
   Lffo7ZU+kht8D62CJaMEKi5MlVxReYPmli/rf8M/1qAoe8DYS6KSeA5k3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="299623703"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="299623703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 14:55:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="763671861"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="763671861"
Received: from satyanay-mobl1.amr.corp.intel.com (HELO [10.209.114.162]) ([10.209.114.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 14:55:47 -0800
Content-Type: multipart/mixed; boundary="------------kmmSIrzdsbBte0dHQX96MiNE"
Message-ID: <fdae3de9-db03-b04d-1992-bc8efd053053@intel.com>
Date: Mon, 14 Nov 2022 14:55:46 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [tip:x86/mm 5/16] sound/core/hwdep.c:243:24: sparse: sparse:
 incorrect type in assignment (different address spaces)
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
References: <202211150551.T7mpZomP-lkp@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <202211150551.T7mpZomP-lkp@intel.com>

This is a multi-part message in MIME format.
--------------kmmSIrzdsbBte0dHQX96MiNE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/22 13:41, kernel test robot wrote:
>    sound/core/hwdep.c:243:24: sparse:     expected int [noderef] __user *__ptr_clean
>    sound/core/hwdep.c:243:24: sparse:     got int *
>    sound/core/hwdep.c:273:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
>    sound/core/hwdep.c:273:29: sparse:     expected int [noderef] __user *__ptr_clean
>    sound/core/hwdep.c:273:29: sparse:     got int *
>    sound/core/hwdep.c:292:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
>    sound/core/hwdep.c:292:29: sparse:     expected int [noderef] __user *__ptr_clean
>    sound/core/hwdep.c:292:29: sparse:     got int *

I think the sparse ends up throwing away all of its annotations once it
dereferences a pointer.  So, '*(int __user *)' boils down to a plain
'int'.  Confusingly, a '*(int __user *) *' boils down to an 'int *'.

That's what happened here.  A __user-annotated point got dereferenced
down to an 'int' and then turned into a pointer again.

I think the trick in this case is to avoid dereferencing the pointer too
early by just moving the dereference outside of the casting, like the
attached patch.  But, it also feels kinda wrong.  I'd love a second
opinion on this one.
--------------kmmSIrzdsbBte0dHQX96MiNE
Content-Type: text/x-patch; charset=UTF-8; name="lam-sparse.patch"
Content-Disposition: attachment; filename="lam-sparse.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCAwZGI2ZjU0NTE4NTQuLmI4OTQ3YjYyM2M3
MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCisrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtMzksNyArMzksNyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgcGFnZWZhdWx0X2Rpc2FibGVkKHZvaWQpOwogI2RlZmluZSB1bnRhZ2dl
ZF9wdHIobW0sIHB0cikJKHsJCQkJCVwKIAl1NjQgX19wdHJ2YWwgPSAoX19mb3JjZSB1NjQp
KHB0cik7CQkJCVwKIAlfX3B0cnZhbCA9IHVudGFnZ2VkX2FkZHIobW0sIF9fcHRydmFsKTsJ
CQkJXAotCShfX2ZvcmNlIF9fdHlwZW9mX18oKihwdHIpKSAqKV9fcHRydmFsOwkJCQlcCisJ
KihfX2ZvcmNlIF9fdHlwZW9mX18oKHB0cikpICopX19wdHJ2YWw7CQkJCVwKIH0pCiAjZWxz
ZQogI2RlZmluZSB1bnRhZ2dlZF9hZGRyKG1tLCBhZGRyKQkoYWRkcikK

--------------kmmSIrzdsbBte0dHQX96MiNE--
