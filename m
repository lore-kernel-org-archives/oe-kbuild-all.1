Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F81376F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740285833; cv=none; b=ehbj/Da8DtpeAISv6yDgLxqgqf/vaJ61hskYCRIYL+qUtLsZIRijG83/EdTdVaQWMG+CvkXFofZW5P5P+He7Tf7+sE091obn+5jpKuimdztbOOqUGvbjrU1D67fl3UFKvDi/6Mz13hxDmli0FTwM22Il6W0ypGqqyt487+1vBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740285833; c=relaxed/simple;
	bh=i9tHIKyqmu0Q7kpPH0LVIjeCVdtrwPNfa6arnASFBz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gotUlSC2fqZF7s4MxhB2P4wisX1hre6a5ZKhLlahlTX4VVz50ejNY/wc7+AlWVW3qDN31rQgQYc6Pq6tl3JA65Slx79JM6WfIs+EC9VVnqI6VPTb1eCVCXWw3dRrLF0fPr6ByZkt2a6hAXX98PUDaHmqSXSA0ydONEAkF3nLrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcsqYrRL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcsqYrRL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220d132f16dso52343555ad.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 20:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740285832; x=1740890632; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+tMJ1ZcQLlSRLqu/hmuLSa31oLRYWLyKNWd9xYEiwU=;
        b=WcsqYrRL+E3zAnq/N7ORGVpcFFyw29Xhv/mH8KZ2wePa9+FUnsSEsanh/QCF2DU0KN
         XQpSGaqRbwkaYiHRAdDNezHpOCu31JTRbpKzX5VTGWviLntdRSZa3Hk77FVyhJK4HdYc
         NFZ4qH92Ty9UTExwVL/WOSZozUfinkjuSETxF9ajE9VxV7acjguQxpJOX++4JpNt5da1
         R3bakwQxf36JnXtcGe3kgy6nk/HU/C2T9YEpbCEGIpNdPfmZJkm3zvpepwdam+0Eafok
         CR2fFBVbkiJ1JkXgR4OyepVjszxMbbb3mFmigEwYVl0M2D7I81kaPiTeOI1Sv9m9bOHO
         fI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740285832; x=1740890632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+tMJ1ZcQLlSRLqu/hmuLSa31oLRYWLyKNWd9xYEiwU=;
        b=AWB17Llc8m0AnQNuo1n3BYey3qBT/I1najcc5LrMCxA5UmjQJVFNlmkXQ1XmT1tZOQ
         u3WWITfj+pmSHCmx5SnBysdwwJu7/WEo+EfZdGehi0O+7KI20szHlk+ec3hd4ops0VHB
         QexjgOICQqDeAgWBunbgaA/PlwbzucxF5Y5/LJZhez9c24nvl6hIR0iGWantf632PGmn
         TGMisvh0s5SaIn3duLpBYJOq+4sFlgUHc9ypZb+sX6FCKC0iKwyp6H2YlaQyA3EheSfu
         L+RhAlz7f9KvR4WjGCUJMk4Gpz/5xwsTfIzSv0Acw8UL5DYjJM71w5HekohMsFixkYfE
         0zdQ==
X-Gm-Message-State: AOJu0YyxLqft1jfzWgHfteK5gViGXP2mpZrqwQufC4R6WI5jrHT1AN1s
	KQxfs6G/c5Ui+VvRr/5Gy7sXDZPgIHOOoCt0ZrWhPqzqf6nj8HU1
X-Gm-Gg: ASbGncuwLZBAHbNCw2v4raGZq8faq0oauttmZrnzbZdup1taCZre8BE7VEBHyA8mmhH
	zbObWd8M4qsXoMu3CIKb0VPMl8HzRyGjUF0BAsFHWnUw4Jv+c03JxRl82RT7yZIo7yiRzNZdX7c
	dFDN9HH2QstiloTX0g2dkt3A/EdogFRF2NWJnwXEk/sm30iwI2vFARqtO9BUpUR0dTQMBC0TujE
	Hj/W48/b1Ecsm2+esYcsDPBCTk06+naxdajXsMCdpoXpYMnLQ2N3KCzOwamKW2eTrTeAK7D42Ve
	Gey/fLTGE22k8yOIyBbKbs3BzOB8PDmG+fxK0Uo5cBN8qVKDZYXlaU9EjBIqJIqHbO2PTDWf
X-Google-Smtp-Source: AGHT+IHW0UWNrtPqy+uW3vUwFT6Cz5UXiypn/MgMNrqL9tryxo0RgH/IXZyhOQm2aOmk7QgXSNwIyQ==
X-Received: by 2002:a05:6a00:ccb:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-73426ceba37mr14386101b3a.13.1740285831611;
        Sat, 22 Feb 2025 20:43:51 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73261ca7831sm14959437b3a.104.2025.02.22.20.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 20:43:51 -0800 (PST)
Message-ID: <22a3bb4b-e21f-42e8-918c-aa841afb3c73@gmail.com>
Date: Sun, 23 Feb 2025 13:43:51 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lwn:docs-next 66/70] htmldocs: Warning:
 Documentation/translations/ja_JP/process/submit-checklist.rst references a
 file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Tsugikazu Shibata <shibata@linuxfoundation.org>
References: <202502230433.CqluCtW0-lkp@intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <202502230433.CqluCtW0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

kernel test robot wrote:
> tree:   git://git.lwn.net/linux.git docs-next
> head:   76a6782284dff53a08b688fdead3e46f22236e71
> commit: 991dabb24232d94c04053955af8e85df72a1e2b9 [66/70] docs/ja_JP: Convert SubmitChecklist into reST with belated updates
> reproduce: (https://download.01.org/0day-ci/archive/20250223/202502230433.CqluCtW0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502230433.CqluCtW0-lkp@intel.com/
> 
[...]
>>> Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist

The obsolete path is in the comment block at the beginning of the file
crediting the prior translation effort.  So the warning is false positive
and I don't think there is anything I can do about it.

        Thanks, Akira        

[...]

