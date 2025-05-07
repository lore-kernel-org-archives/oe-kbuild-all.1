Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11828DB7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640535; cv=none; b=mNGUE6E1CQYrAwemPAlNhuVJ6yRAYK19kOoTqEijYWZzdCuAPbUvpxfTVLzs4T0VZpleiHk6PjwWcmN/a484V6CovtIej9Z5/zgr8GfN3LC+EKgunX9UDRJhruM0jnt4K7WzAaLzEjPpDru2y9sK8Z9jDYUNXIG3uvZbwKcIbxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640535; c=relaxed/simple;
	bh=2yjqvg1WU1jwy46TAg8Ie2jB7YFcpI6yvblT1OwRSDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5DoYWTkXqDJt0BIGLhuelam7x2x3QOcU8iHd8K/NYRQl5P006GEpgfMJ1c0q/Ishp42n7QTiaGaCeyv8nCi99LDDS8eeGbjEXeDLUHHVw0+Ac3M8QZ+Mnz2p/vc/oYj3SYQStfbPdtHKB3mc3pXzkFRZTM1cuiudru2oFx7P7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3uKs7YdA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3uKs7YdA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e39fbad5fso15575ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746640532; x=1747245332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5UyMF0lz7xhmrPifBK0SwWTEkKxLHvGU3lEBmsQ/lk=;
        b=3uKs7YdAlU/vdgQ+0axGAucv24FCus76Cve8K3kVBHrSX52uA4aVwXJQNyH+nQ9EhT
         5wZeAJt5Y1/ScijUc6M1Uz6IK4hGk8qc5WJehJhixKFp6rM17lxiFINRcdwwS9GU/172
         m/cWB5tIJf/ew2ssPZCXryapnOvdUTHDCpchnWJ/toPx2bbSRUHXWOw4CumYclHIvJbd
         xXbevIy2Avp+mi04aqFCA5DTNZHtX8Rb5WsBqNgmdiVQ0unWKhnu+OHWIIwL35ZNYwxb
         GlA7WgRbIcBufvG1gigBhYo5LuAvr83R+x1l7MNZgnJrnEdKxgLVA5oPqeTCJFVQgWfX
         Tm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746640532; x=1747245332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5UyMF0lz7xhmrPifBK0SwWTEkKxLHvGU3lEBmsQ/lk=;
        b=orHZw4g/fkk+n57ivG1yakavKbZtJ8/iNMpeyavbgJPW5SysE+Q1asCMhIR9DvlSpH
         qQ+yvNHB1Qu0g9gw23XUx27Y7yHZaJP9R5CjnW2nwStJHIpe9h3IwRkUXdgspUde8Hhz
         dmoYxK2qZT9IVdWityLqVfH9wPhJKlSJl6rHz5m0FsX83QYEfdl+Fqgtab5Szox9+p/f
         j1qn2eeXbksZfymnLykQKrlHv72aEVCIMZxGC6mP0RmerG1KkWI+bCenVb4kAlrfIf1O
         sHKNXep79zhZEGvopo/Fvg9OpHeMCvbh7uX5VmQ41Bakc5KbZyEbQTEyHTHTayrwLr4P
         l2pw==
X-Forwarded-Encrypted: i=1; AJvYcCXCGIRuzL/EnSZilDnYahe2H5QMqvVQAAsE/SlOnUIlbx5DucKjrDUe34rUg8XtckMYxMdrgpkuCR3MGx6Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6icUX+kTou+LXUyUawESknZq6ygUAeb+lRA2T0AakndCGrIDD
	CH8eT1h1IeaUou3oCM8R6g724AflYT5a4vPEkVz93AjX1PtMBv26qEHXgGgYpw==
X-Gm-Gg: ASbGncs8xjLuTSdR4Ou25d4QRRs6oIy+m4asTkBpfhycZLOhG3MFA5rK2djdKLQcXiU
	X959krDXXSHiPbDNky9ZVjasKyF6tXcvkrgXoC+a5yfwp0XE1HLZZau44bmX6Sy6rhWeOwZCSvT
	ezXNpH68mDwmhEoqhQRgAiNXso3+yHvBVtKuQMHi8hNBKD1jv2eRA49VkVKsSTY6L8PXrF9lTbE
	eh04KFwUGHzVg7NRi5qH4EKU9W3NRo4Zj6B7R/l0oMf6MUaoTh54VinNeZSLDF8sWiRvUKqpxGL
	cJtzbR5hUZqIWmsI2u3h/p8N0DMO+DvpK+WjXZSZlj51pzmmeA9bj/3EIx4lO/fmGEh1sFNIqFO
	dLCnLwFl6
X-Google-Smtp-Source: AGHT+IFKJVG42Z0t5WGhpwZ+Cr3LZt4lFtqMG4tXP+ONkLN3fygx2dLRpldx7EugDDQaaH3giSthOg==
X-Received: by 2002:a17:902:c946:b0:223:37ec:63be with SMTP id d9443c01a7336-22ebf572798mr85555ad.4.1746640531580;
        Wed, 07 May 2025 10:55:31 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe239csm473357a91.32.2025.05.07.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:55:30 -0700 (PDT)
Date: Wed, 7 May 2025 17:55:25 +0000
From: Carlos Llamas <cmllamas@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Tiffany Yang <ynaffit@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 2/2] binder: Create safe versions of binder log files
Message-ID: <aBuejWpfghiB9f7-@google.com>
References: <20250505214306.3843294-4-ynaffit@google.com>
 <202505072254.2gHv8kgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505072254.2gHv8kgu-lkp@intel.com>

On Wed, May 07, 2025 at 08:19:07PM +0800, kernel test robot wrote:
> Hi Tiffany,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on staging/staging-testing]
> [also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.15-rc5 next-20250506]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Tiffany-Yang/binder-Create-safe-versions-of-binder-log-files/20250506-054556
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20250505214306.3843294-4-ynaffit%40google.com
> patch subject: [PATCH v2 2/2] binder: Create safe versions of binder log files
> config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072254.2gHv8kgu-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072254.2gHv8kgu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505072254.2gHv8kgu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/android/binder.c: In function 'print_binder_work_ilocked':
> >> drivers/android/binder.c:6409:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6409 |                            (void *)node->ptr, (void *)node->cookie);
>          |                            ^
>    drivers/android/binder.c:6409:47: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6409 |                            (void *)node->ptr, (void *)node->cookie);
>          |                                               ^
>    drivers/android/binder.c: In function 'print_binder_node_nilocked':
>    drivers/android/binder.c:6487:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6487 |                            (void *)node->ptr, (void *)node->cookie);
>          |                            ^
>    drivers/android/binder.c:6487:47: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6487 |                            (void *)node->ptr, (void *)node->cookie);
>          |                                               ^

Oh right, this is silly. The reason is us _not_ using fixed-sized in our
uapi, which was unfortunate. In Android we don't have 32bit builds that
typedef 'binder_uinptr_t' to __u64 as we always pass -DBINDER_IPC_32BIT
for such cases. It is not the case outside of Android though, so this
needs a double explicit cast. :(

	#ifdef BINDER_IPC_32BIT
	typedef __u32 binder_size_t;
	typedef __u32 binder_uintptr_t;
	#else
	typedef __u64 binder_size_t;
	typedef __u64 binder_uintptr_t;
	#endif
