Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E026A0A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888494; cv=none; b=kj9i4afi9SDiYpO40rSu6Jdu7WYdlfRMZlcbTaoY6h2C4NIbTo/nhUdY0/7dPVYCLf8wPdXcZXKlao1crHpQFgmEH0KmUvZzU633teaYZS3MLSyK21l3O8Lhc6pFeQCimX1q8GSP+T8EaFS8i3/xHwA9a7/ecIS0jWDLjw/Me6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888494; c=relaxed/simple;
	bh=33TMhdfwzRIeMgbcmfNy/XvfM4Ozc97THaJpS4//qnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXMszT7py6pIuiRfJbXZO/HregHBKzVMGTY1jeU8n3zYod/kdjx7H0CRKP7pD8G+HvIfs8xM9FkheSrLVjb4bxg+KqGYymez7RZhdvk0R+U0WKLbUixQ5OxE9z7CwckIjWXVFcNea9tQMKKsRinskF8/lo/0Td7sR/d8+GC/Aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjpHOUbx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjpHOUbx"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so10040752a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739888491; x=1740493291; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epp5Oj1kI3V0zqhBHGE/nEmzKDkVzIEDSBJvoi97Moc=;
        b=GjpHOUbxMCFtbrPjnZjcM9Wk87UhFs9fxumRQYKeCsRBKRfue8cQz7WgM7dBJlRbt1
         e+EpsRTNDa/eECCR5tekyiGO4PiJQqIpI7k/d2/MYJ2Estu6MTwE5E7t+XYpW8bZ3Ihw
         nj/UTqFG3vnnsxiW5eMSsJXiq4iLApg3TBpImaixM6zWlPVB7H/6jvt+lF8BhddYjz3E
         Js2qE7l2iJ0P/mCXE2UYR1mdURZAYun75ZbA/VZobz2rdOWRC0fQYL5L1ILYkC08tZ2W
         b+I7xCi+1cOXlcbOj4gp/WKBVqPz/jFyEb/XCkpX//Nt6p7eCIt6OuTyCLh9r88mz7kk
         uyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888491; x=1740493291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epp5Oj1kI3V0zqhBHGE/nEmzKDkVzIEDSBJvoi97Moc=;
        b=Cu9nX55esmTuZ+TbMBxkUJOJWsKIV7iwnwMGLscqnGZQ5ySiiZ39zvD6oa2C+cnuJm
         e44fZIUrse5BH697jOASh6FYtuoR7qZKb2PuG8nOYinY0C2qYquJRl/vWSP6Y5xxOzF5
         jaY0jQkYncZ3WWmVFz4a2YGpmOg6HRnbQZT49FSi7+uW0X1Q5gtzjMBU6gqtseS0gsRY
         nwO9fmaL18+z9TQ+3cPOcqst2k90Ob3snTUOuwAf3iMUwdWZffBsw++nY8rV0NM7YFkR
         waaWm2WhW9014FBKEmaGGYIz4D/kukujcvkeh2UeXmFtukffdjUVJ15EzZ05fcOnuq4e
         vAeA==
X-Forwarded-Encrypted: i=1; AJvYcCVvmpajQ6+6Zh1BDH7q9NeUOyKNnCyjyZxcNrX8CIhRERP9pJObsa+acjoZEU6eHavpH0ebbjybr9mJby02@lists.linux.dev
X-Gm-Message-State: AOJu0Yypj5ylHcpyb7b3MosKXbldmqHv2qmHe9fbgLot7L8V6V5mSlla
	eKgkfciKQPjcH729yRZBqVvCGKwDdMzPRXOv1kinzhSY1pSszg/mm1DOPfFEtlUiTo0XZuSkAqo
	n
X-Gm-Gg: ASbGncs9GhsOd3wrvSGuB89sffeEFzVhz+3ncntTzG9yCMcark4z2WKxd/IqknMasLK
	rLSf2c/QHdMNv+uC6HZ27iPq/UihRsKZED2s9rA2WUBu0W48BOPIbcQJkhftXmR8H2xChpjHFpp
	JD08f/8pAvgQIDAIFpb60lBcQ9WBliYZWZyjcUiAA+Xz2yBqKzHt1c+qlp5pvqQrOFOHmR9O0WR
	N1dpRTXwv28WvljMKl8yPfY9hmafDKxpTsJU3Wx2riD+QHitdVhDfgp/zQoo0XQFLNQeEeLidIC
	3pMmRj1UldGnETBpvtUL
X-Google-Smtp-Source: AGHT+IGm8Y3zgYesHPFu1v5tsyTj/+j/bH9iWtpP4bLHsu1ODM2GS9NeO/WPPPsgDryp1DtOkgMs3Q==
X-Received: by 2002:a05:6402:234a:b0:5de:a972:8c7 with SMTP id 4fb4d7f45d1cf-5e03722345amr12702547a12.5.1739888491339;
        Tue, 18 Feb 2025 06:21:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1b5415sm8699308a12.4.2025.02.18.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:21:31 -0800 (PST)
Date: Tue, 18 Feb 2025 17:21:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Christoph Hellwig <hch@lst.de>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <78ff844a-0fb4-42f6-b54f-4d19e14cfd05@stanley.mountain>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
 <20250217092445.GA29568@lst.de>
 <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
 <20250217131203.2657cc4b@pumpkin>
 <Z7PWuSA4jtZnxp5J@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7PWuSA4jtZnxp5J@rli9-mobl>

On Tue, Feb 18, 2025 at 08:39:21AM +0800, Philip Li wrote:
> + Dan
> 
> Hi Dan,
> 
> On Mon, Feb 17, 2025 at 01:12:03PM +0000, David Laight wrote:
> > On Mon, 17 Feb 2025 13:06:49 +0100
> > Alexandre Ghiti <alex@ghiti.fr> wrote:
> > 
> > > Hi Christoph,
> > > 
> > > On 17/02/2025 10:24, Christoph Hellwig wrote:
> > > > On Mon, Feb 17, 2025 at 01:53:08PM +0800, kernel test robot wrote:  
> > > >> New smatch warnings:
> > > >> fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is never less than zero.  
> > > > Looks like this is an issue in the riscv virt_to_page implementation
> > > > which also shows up in various other places.  Any chance this could get
> > > > fixed in the riscv code?  
> > > 
> > > 
> > > To me, the only test that could give rise to this warning is the last 
> > > part of:
> > > 
> > > #define is_linear_mapping(x) \
> > >          ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < 
> > > PAGE_OFFSET + KERN_VIRT_SIZE))
> > > 
> > > But given that the config is a 32-bit config, it should not be evaluated 
> > > at all.
> > > 
> > > Could that be a false-positive and then an issue in smatch?
> > 
> > Why is smatch even looking.
> > The equivalent check in gcc has been moved to -W2 because of all false positives.

The Smatch check is a bit more sophisticated than the GCC check...
I think if you removed the (!IS_ENABLED(CONFIG_64BIT) condition then
Smatch wouldn't trigger a warning here.  How would I duplicate this
warning?  The "ARCH=riscv make.cross" command does a 64bit build.

Screw it, I can just silence this warning based on that it's a kernel
build and the variable is called "_x".

regards,
dan carpenter

