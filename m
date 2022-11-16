Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591187C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 00:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668559722; x=1700095722;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jdxemFICCUVRqw21+/QhmStA6qNIYVoMBN+x0XTl/Cw=;
  b=m/dAd3a6GZPQPFalJVoH7g5Py2jC7/dg5zj+F88if3NQz0yiQuhnc9Gd
   ke1rXK+D99q9xGREnKZwf9yGVGLH0e0ixFulZUifWHlqN4vw6ryKnNSEP
   MNVJrd8tWPGIOw/vn36J8gZPg0rl/zB0VHVt/J41S1zPetua2e0HDtTVK
   XyNKNYRZGT3w4Yk4KKI81OwjCsmLsO/eEqWXuP+fD1VZUl7MlyEe08jz5
   xi580dKddLJ8QysWgJfpz8JPLtCksEBliFQAgHz3zHvNBZIoHTh2/FuKU
   hD9F2NliotnfEVXux4ocr3SG+n9ZIUPd5AvVU7N1SXYKV95iXaWM6uUua
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="339218777"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="339218777"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 16:48:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="884177755"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="884177755"
Received: from dn-intelpc-071822.amr.corp.intel.com (HELO [10.212.229.216]) ([10.212.229.216])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 16:48:40 -0800
Message-ID: <9c96f82e-000b-88f8-fa37-753ed6723119@intel.com>
Date: Tue, 15 Nov 2022 16:48:40 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] scsi: Fix get_user() in call sg_scsi_ioctl()
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 kirill@shutemov.name
Cc: dave.hansen@linux.intel.com, jejb@linux.ibm.com,
 linux-kernel@vger.kernel.org, lkp@intel.com, martin.petersen@oracle.com,
 oe-kbuild-all@lists.linux.dev, x86@kernel.org
References: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
 <20221116004353.15052-1-kirill.shutemov@linux.intel.com>
 <20221116004353.15052-2-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221116004353.15052-2-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/22 16:43, Kirill A. Shutemov wrote:
> get_user() expects the pointer to be pointer-to-simple-variable type,
> but sic->data is array of 'unsigned char'. It violates get_user()
> contracts.
> 
> Cast it explicitly to 'unsigned char __user *'. It matches current
> behaviour.
> 
> This is preparation for fixing sparse warnings caused by Linear Address
> Masking patchset.

What's the side-effect if this isn't applied?  Is it worse than sparse
warnings?
