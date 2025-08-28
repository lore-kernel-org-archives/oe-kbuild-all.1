Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF2224B12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756399437; cv=none; b=VoRLIX6aqYxuEt5j9edDqTkr9NEvqdgZsSzrqf06+lCsM6HkT/WoIBoXUjvp++tMGvOMlGMyN4xO+6vgRe70yw9lIOgmy2hgtSgXWDSSpJjJ0a2bPBzt/unUuK8djNBtE6MjIVQ+qg+FZrkSD5llt3U94q2eDml9okdBe38M+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756399437; c=relaxed/simple;
	bh=6Cdpiq+Zzg2lIGGkSRD5WELvl2nCdU/wD6GSA161iwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIDJcJrszedUvPXRTJ1ztKHpCI/cgbh2OzmoYO1bRVe/3ErSJhQTvyIUhj6T7WxZqTdoS0xTh412GuufCU5WFm5ZSooFekHMrYzdY7DfwF6qMrFGJ0kABAtRqSx8/h5y4UhNk8+DNxV1O/4DwqEm/S6mVUu/kW5JpTU9OKOnmyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AFaH119u; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AFaH119u"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7721b8214d4so836956b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756399435; x=1757004235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8blEVa85dDyW3Z+dNJYIvBsar0sKOxqyFeme/7/E2N8=;
        b=AFaH119u7A608SeI4g+d1XbV6MfsZPi1WQjsbWQVH3k9yA1kt2DsXVC8Xc9CWiUozw
         PKCbTG1IfBOUOWRjJ+umma3NW57S8ILa1O7QHvJ1dRZSQMo4JeM1PgaR/lpdiwVOqmMo
         gtrN2JLs/6jfnncF1rWDIDEL1qG/GWMKpkrt5tH0LSvW+f6ZdEEj5mN4ettopjvxuGPr
         18P/vIae9kRhD+eYG8fwTDOy+sliwXmTEknVKnUk4Rw3CErvvIFc7np8zctByq7qUDa0
         57D1JZPC9j8u4dItOj35oG4q4rM1FwewzevXyVsT0HlCSCDJtnmVNwbnbyJPEfsrOq0O
         9hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756399435; x=1757004235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8blEVa85dDyW3Z+dNJYIvBsar0sKOxqyFeme/7/E2N8=;
        b=uaGA9wcFCLj4i39P7ao3888VO/Oe7O66xCPp24BcsQLeVHMnQ/2zrsDIyP931caA//
         /qr0dRlE5vkelYgGQNFzkQzbdlHOVispdohsG21d5rqMtwSvOvkV/Xg6I1l4NnEy/7rq
         Sts849oZvTa9F5NUWXXL6S9lQwosVjQ4x81MaAlfa/2S3Zc1UI7o4QqsVC9cPfBYFvLy
         HfSKgyaPJe4OZjXCNM7uQYN1YFMTWCSZdpBq17UZ6ebRStUjuclWtG5zcQBlx6gbHy3w
         rZR1sKxIWz++pI21W9qLX6JKvOt3mw1W8DkdK+xQKPYRfZTGnWb73Y1oMLNqxfFfV4hv
         2iMQ==
X-Gm-Message-State: AOJu0YyYeLDzd0rKWoYNncD2HSZF8ERZW1zkA8un3DNFh05uOZrqZqGX
	oXbdB09oJcRvDHoSMs8lpQkbUYnVzOzYqO1uQm6cwWNFyuKB+qFb9AbvD0vT0aDzsg==
X-Gm-Gg: ASbGncteRZqqcTvtBqg0QeNodaM4Vetes+hfRN1Lu+MlnJnx0llk7b6+2EZrOdK4x1o
	dpFbTCe/mScyPOs+4rkKBlFlvRHy9X9QB/I0oMytpSMvT0yz4Eg4SvaRlv2JpSjQEpys+Cao97L
	x8eag2K8EotYRBrivaP52Q9Mqxjv5AvrDr8uAyjMTit1X2s0lnioc8rhBX+N6zpZ7QQ1eJKFBq0
	4f80Eq5fVfXqxYU5Qy5dEXmZHFsWDumj4Q76KCj7HCrPt72nvYeZR5WtEbZENlXyPqWsJLieQ8W
	M//ZVxOcFPV3yc6/nGxZizeLIZ2Z1lYAlsEjKGra2bj2rOKU6Gm43i6Lv6CqKdUjKzy9hUjf4YV
	z72R1AWecPuMg3XpnkdceJdGbROE/OvtySKz/I0RlpuOy0Z0lI7oCwIxVycAeQSS5NltjdkCdoI
	BF1KHqkaIJel3ykS/E8Ngg
X-Google-Smtp-Source: AGHT+IFMy7ShxWIeqlyJjwrda2ndy0stFzll0/vMdsdQ1HiUhQJpb1uUs9R19cFwupqaIiTdJVYSvw==
X-Received: by 2002:a05:6a00:391a:b0:748:fcfa:8be2 with SMTP id d2e1a72fcca58-7702fa09c17mr33404597b3a.2.1756399434797;
        Thu, 28 Aug 2025 09:43:54 -0700 (PDT)
Received: from google.com (13.42.168.34.bc.googleusercontent.com. [34.168.42.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040021393sm16523940b3a.49.2025.08.28.09.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:43:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 16:43:48 +0000
From: David Matlack <dmatlack@google.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [awilliam-vfio:next 5/37]
 tools/testing/selftests/vfio/.gitignore: warning: ignored by one of the
 .gitignore files
Message-ID: <aLCHRCKsPTFQfTOD@google.com>
References: <202508280918.rFRyiLEU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508280918.rFRyiLEU-lkp@intel.com>

On 2025-08-28 09:18 AM, kernel test robot wrote:
> tree:   https://github.com/awilliam/linux-vfio.git next
> head:   9f3acb3d9a1872e2fa36af068ca2e93a8a864089
> commit: 292e9ee22b0adad49c9a6f63708988e32c007da6 [5/37] selftests: Create tools/testing/selftests/vfio
> config: i386-buildonly-randconfig-001-20250828 (https://download.01.org/0day-ci/archive/20250828/202508280918.rFRyiLEU-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280918.rFRyiLEU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508280918.rFRyiLEU-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> tools/testing/selftests/vfio/.gitignore: warning: ignored by one of the .gitignore files
> >> tools/testing/selftests/vfio/Makefile: warning: ignored by one of the .gitignore files

The warning is that tools/testing/selftests/vfio/.gitignore and
tools/testing/selftests/vfio/Makefile are both ignored by an existing
.gitignore file. That .gitignore file is
tools/testing/selftests/vfio/.gitignore:

  $ cat tools/testing/selftests/vfio/.gitignore
  # SPDX-License-Identifier: GPL-2.0-only
  *
  !/**/
  !*.c
  !*.h
  !*.S
  !*.sh

This .gitignore is designed to ignore everything but directories, .c,
.h. .S, and .sh files. One-off files can be added with git add --force
and then git will track any changes to those files automatically going
forward (even though they technically match the .gitignore file).

I stole this approach from the KVM selftests but it looks like they hit
the same warning and decided to add their one-off files to their
.gitignore file to squash the warnings [1].

I will send a similar patch to fix squash this warning for VFIO selftests.

e.g.

diff --git a/tools/testing/selftests/vfio/.gitignore b/tools/testing/selftests/vfio/.gitignore
index 6d9381d60172..7fadc19d3bca 100644
--- a/tools/testing/selftests/vfio/.gitignore
+++ b/tools/testing/selftests/vfio/.gitignore
@@ -5,3 +5,6 @@
 !*.h
 !*.S
 !*.sh
+!*.mk
+!.gitignore
+!Makefile

[1] https://lore.kernel.org/kvm/20240828215800.737042-1-seanjc@google.com/
