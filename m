Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FB345749
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 04:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781107; cv=none; b=SDM8os01EJHGNAWSlcJ3iNmfeZsHDNvNoSs/OwlACiTpPnQ6a+s8wWqrVcEdL++sTnSsnkNrezANqJTLw4TbCwuyroP6uarULANAQ7Hg6gp01aOEcOs1A7iiUSKcL8i/oPorJGGKl4/AKuAhW/g/6/LW7Ra4oUtnQqPZppZ+X4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781107; c=relaxed/simple;
	bh=/88gb4xXx/ct8SYmwoUN77gPHy7bOsWujBs+78VQ+YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXkk4A+gCImQDI6o+5X2xPL+Xfa68dG+sh+Sefcewo4JvfYyZNWbHvJzjvty6sZ36dnld4oCDbOH6+0GNT7nnSm3dALQ4S1UKO3Xjxw0Rh8i43tdEPzYd8Y089e1UnlVlGkQUu+rL08CGZFKxxg0o0fJ0RoYCv2W1JJqHD5srXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKM+RVfw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKM+RVfw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so2177184a91.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 21:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781105; x=1792385905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhfckbeXLIpMxAPyiq6IgFMQs1IKyfPcAZ69OLh1xDE=;
        b=KKM+RVfwzQKoJ/H65ZrT42PHtAk2I5XzGSXAOVGsSdacDkFS9b+qrU5Y8G0Y5WLvfB
         GXLaVvquB+Ndv9+XUzy0ETZhBOahhQgqy7qlrh7yzwlr09VJv8vMSAFxO8bcLHNzorkU
         LC2jCYpEKjMPBDm/W7nK+sUk6enhGcG+Llnjs4FVfVXXBecavFmX75muF5kMMX/nbDDW
         wAY4RKgf2A80qSPpuE4QjBlNqkopuu/B2NbCAQEFBvOcYyvO0IY3R6QuC8nGmEBVB6To
         0QtGLQcNKlt6soPv3DpEio1nuPO6EU6arudBv0rcwb4k2IK6QML61ydUIHejNE8SI8uZ
         G4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781105; x=1792385905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhfckbeXLIpMxAPyiq6IgFMQs1IKyfPcAZ69OLh1xDE=;
        b=Wz6emEdJeHhs0t1n5qHrmxdjHfBCrFmc7lTg6P23uxVEnZh89K2+MesWDEv19n0bIN
         TkC7THEmvQ0DIefdLkSk2Dm/TKyYtCAiWX4xjOS+fX9+P45Yw5Dmk0oXGMFnSmtbhPyw
         uiZt+f5GfHgpop/ao96V3K+rAgd1pxd+C8/i8AeSQjl8qeg38mybfXK8V0Mf/fEryBEA
         prSGDepDj0fpdeifmXeeuFzAwUSE7/HsVlx6isjgqI8MCvGL4IEIms41qa/jrspoBr/+
         NmxyS40KN5KDyGOVkFN33sLSKCTTc564pa8IHb4mFsugVjbOkYiPNC9lU8xp7UBCL7Uk
         THGA==
X-Forwarded-Encrypted: i=1; AKwUvBxeoVVJ7GhNyYCNFnK3gPgVjMR04N38CC+Cp8DWcWP4Huj+wUS/EahOYeKz4eLiH8EL3VSoIRXmCAI1kjGn@lists.linux.dev
X-Gm-Message-State: AFq9FYIx/bV9evM2gG8SCkSUQYgtGuwUlRaZdXtiFMk9+E7u6BC4gJNm
	Z+8i+X5dtT34O4lOEsyLglIcmrVRlGmnWwJ/EGG260h9vQnxji3L/71t
X-Gm-Gg: AYBFou0wbd2nSIu5waq0eVv60qjTJm8hZGu5kvszJ+4zkfl959yxkLdY0c+fSEMeP6X
	sKKRK2dwXe9sBSA4I0lxAGOcg4Y4PN16CQLuoED8iCLgpzKkJ9WhwYsPUt9JPzUisRiHCPw2f7Y
	1c6spMk3sFBIsFgTNRsPoFviqKYikfaZHr5P7XGRN7MLkwFPmL5J6LKtWlZWWgMRpWVtXkoHyVG
	RVA1rjRCpPBV4lKHvp0KZG1zgH0u3Q4MPsUjsHipxAZtUWAaKABCjnFFMcsYPaI5MgJiYtWwjUn
	ERZ8oYSVFZGc+clrWhczdBl6YnSTXNmzISSSFmv5NoeaFNCz/9Lv2wUSwZteF6LmToffY5r2F6T
	NxUXpBXAb3SdMbOe8if+oZE1OZ1fq6mUvEJebWbTuajqHh2GVmQk8V9qvSFqVC3R+MnaQNjVfcv
	H9fxSzx+Uk2gqwSo628i4RIkzEUp3pBgR5+U6WFc7piZatu6KM12IZi9SMc8idqUM3nLEG1smXA
	JotCyn/bxG+YQeKU5M=
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr5364614a91.0.1791781105353;
        Sun, 11 Oct 2026 21:58:25 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm14143895a91.16.2026.10.11.21.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 21:58:24 -0700 (PDT)
Message-ID: <df2b0776-00d9-4ac7-9d6d-316f86971c41@gmail.com>
Date: Mon, 12 Oct 2026 12:58:18 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tytso-ext4:dev 21/41] fs/ext4/inode.c:4002:24: sparse: sparse:
 symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?
To: Theodore Tso <tytso@mit.edu>
Cc: kernel test robot <lkp@intel.com>, Zhang Yi <yi.zhang@huawei.com>,
 oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
References: <202610082225.lcsAyIiF-lkp@intel.com>
 <5bac3071-5823-4714-8c39-662b91c927a3@gmail.com> <ask6HB-62-bUBb7u@mit.edu>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <ask6HB-62-bUBb7u@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/10/2026 3:03 AM, Theodore Tso wrote:
> On Fri, Oct 09, 2026 at 10:55:18AM -0500, Zhang Yi wrote:
>> Hi Ted, would it be okay to replace the current version with my v7 on
>> ext4 dev branch after I send it out?
> 
> Sure, no problem.  I took a quick look and it looks like there were
> one or two new Sashiko issues?  I'll give time for folks to take a
> look, and I'll rerun my tests on the v7 patch series, so I might not
> pull it in right away.
> 
> 						- Ted

Hi Ted,

I've gone through the Sashiko and syzbot reports one by one, and apart
from some pre-existing issues and false positives, no new regressions
were found. However, there are currently two nits in the code that need
adjustment:

  - The WARN_ON_ONCE() check in patch 8 is too heavy and is better
    removed, since it seems to expose some corner pre-existing issues in
    the buffer_head path and causes syzbot noise[1]. This syzbot report
    doesn't belong to the current series and may need to be addressed
    separately.

  - The tracepoint in patch 19 may print an uninitialized map->m_pblk
    during delalloc writes, so it needs to be initialized. I'd prefer to
    initialize it separately in ext4_da_map_blocks().

Since you've already started testing this series, and these two nits
aren't critical I think, I can send fix patches to address them
separately, or let me know if you'd prefer that I send a v8 instead.

[1] 
https://lore.kernel.org/linux-ext4/34423908-aceb-4c57-9502-7da10b12e4a4@huaweicloud.com/

Cheers,
Yi.
