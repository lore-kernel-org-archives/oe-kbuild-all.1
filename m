Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4468C155759
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715786636; cv=none; b=U8ZBDsz79B9xb7pchj0szQlpcHPtxY0KvqcAjGHIzh6fYZnatI4sDXAKD/3V4eD3rrooePcRexVerC09sm2nQH3whDBEklx/DcKHk7MBepzofYFE/udq7NpRFuJlu68rwS5BvM+xI8houGQLW5dy8N10FG7TuL+ASAl/MN59nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715786636; c=relaxed/simple;
	bh=4vNQsefI9wVjstBFUGHLWiELzNcBEQZ6OPfl0Tv1XfM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qST3FAvYmeCBLNPQcHcWlzvPhHCsZa8RzOVPpKqK+Zn/Ikgn3YlQX8Uu0NfEDG1cbyb8Kaa7ciV+6wfPirbqvZMRktXT3f3/Tj4jKv9VZrkUvwVdfJbkl/zEWloVOKziezGv75mgLLfKydrdLB7hemhNL+O9rB9gYvfNKtjlCwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iz85YiGw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iz85YiGw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2b2738ce656so5905473a91.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715786634; x=1716391434; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WWnmrR2jgRtp2pBl61PXM01ccmNjY/9pMcH4gpVeV3A=;
        b=Iz85YiGwBXbCtixmuL1S0llNT/2hiHzqQzdyPj+28tZ7Yoqdo3/6dPSMY8HfDbHQW3
         lusDbdWj6AE1+BvCbQGZOORgM6xc2lupc+HV+EUcXbq0hJVOz32mrxWSLzX3Pe7ChPnR
         Ig3HRubGDdv56oym9RUEoJYHJ9lFMmA35dPdztGxZxfkfFvuLLW546fhg4yF+88RVx/Y
         4h2/9/cM7qp7Tr3wtnUKESbhlzb1YAq1+82OjoGHebAWQh9Mt/EyIaF4npWs4Q3E1TMz
         3u9pwrGptQOs4DrX5JLNFG+BNJvAnj3XmxiNYXcIpa+kI3yJ+XnDWHi5zI1PK7Lhxn3k
         qYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786634; x=1716391434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWnmrR2jgRtp2pBl61PXM01ccmNjY/9pMcH4gpVeV3A=;
        b=q27tYzWHAq7OOYQ1NFmrdKdCAjSx2UcLtzSfSeBXozv8Iuhmj6aC7eSF/jL9l9inrS
         TC9H+rEftSly8y8BkhkV15WCZYgmdOoJRw6eBaqlTzR7+kniFzXNzNrZdryhqUhsmS/Y
         RKZBQxpuVzUOtUcxk4mxTU8hUfL6h4LKbLNDhC+XU3vMVvFoONUsSxg0PiXjASJymRXH
         pYu+ApX0/WicKe9ytcHpidRBO3PbI66GeTE823Vz/t1GH37gqOHUCg9tRCs8zm4fu4ee
         q8l0eRJbsc93uRFXfGvR+UozevNAUvheMkZiS6FHT2EnEAPMJoq7I3j7o0MLsR1JiolX
         OY0g==
X-Forwarded-Encrypted: i=1; AJvYcCWUGbg9q4UIG/Ov5AGMgj4KM7xYssg3TtipmAajho0/glZoS/dPa8aDEhYnhFiFuFWPl1TR3DEo8PMDth9PjClk2GaiRSLgeHnCHDKTHg==
X-Gm-Message-State: AOJu0Ywc3M51GPEH80X4cnPMZ8ZUVbzX8wnuXOayE/rqK+gpIx1WHeNz
	7WtLc8GH9RakQQo8RH0XwB0cIX+zTTUO4E2VJHp/7gwN09fynEpZtv6jUGGpIqplfcEwzYU2Pvl
	shA==
X-Google-Smtp-Source: AGHT+IFnqZqx/mgJK+s9Xm0/QHqGZU9eAGN6iIrsfdlzzK/0rpwVqzca3Bb+hArr+TUuEno+vgvd3lYqIYY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c243:b0:2a4:70d5:2dd9 with SMTP id
 98e67ed59e1d1-2b6ccd887bfmr45643a91.7.1715786634412; Wed, 15 May 2024
 08:23:54 -0700 (PDT)
Date: Wed, 15 May 2024 08:23:52 -0700
In-Reply-To: <202405141601.VXdtmd3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202405141601.VXdtmd3C-lkp@intel.com>
Message-ID: <ZkTG2WGnADfprMbH@google.com>
Subject: Re: [sean-jc:x86/gnu_source 41/42] tools/testing/selftests/kvm/rseq_test.c:223:undefined
 reference to `rseq_register_current_thread'
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: Edward Liaw <edliaw@google.com>, oe-kbuild-all@lists.linux.dev, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 15, 2024, kernel test robot wrote:
> Hi Edward,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://github.com/sean-jc/linux x86/gnu_source

Ignore this Edward, this is due to a bad merge conflict resolution in a branch in
my personal repo that I was using for review+testing.  I'll simply delete the branch.
