Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388C79F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 21:31:29 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id s67so8649800pgs.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t3DGLS6aiN2haRQRmmZBIBnI3OUSAOT+GVNpjSj7IVI=;
        b=swoStqpnzaDcsLLq3p6Foz1OK+scWwFGMhGJHCEGy1ZVxsIy5nGbpMH+5RL8iJfzkY
         cFeNC/bfYu6xT05Hkd0Cn173lLcZ0t823ihlYMAvo/w+yg+ltyplmfhcW3w57Xe6LzhD
         Ktd1da4tPuRvhRe5ieMnKrKdHWT9MYfee5QkqQ2mE0SQmjSZEkLRomflmLCdycOXPmRN
         4/eeHf6Z1TGDSrA9/H1Vpmtm4Wc3o7VUAK8tHqBu/Jx7zB/orQGzTF0Pg5yyunFZUIS3
         o0yl8ewSLqJkl/0PtPf8+/6kekjp+Te4i2HGe7W0sd7n/rAwq3sgrseeAETWARElimMN
         1uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3DGLS6aiN2haRQRmmZBIBnI3OUSAOT+GVNpjSj7IVI=;
        b=IVEDVmBRYgm1exO+tY2AaQ/kaWtLv8f/oALBY5rFZA5Pnwp6a/S8vTASDSVWywkSP5
         HuETB1g48urtJTWfdhKqmn8qfyYdXPnL6y/lmKLo7NGP1NOnZ45UYatMj39eBnrqrE03
         7qZYPPQojXn+NOAuUcSe0O6/2Tb1CcCTOCfXJezSITQ+/ON5D35TP6RtGasvQ/UFNqW9
         9whpMZH1ExyQyjnQiu51A5rwGMuB6e25LTLb42z5G2Zo0olpldYwIi4Xct4D/BE+UAJI
         dlkhmK8mgu/xRphLNQa3GxOWwoLndqdqgVdRUP+08esQZ3Gtshvv6nSZKEYFTxOKUuDM
         I8eQ==
X-Gm-Message-State: AFqh2kpm+mxWFNv5mQ5XFyHcKfbwfd5qpnS8nbCUKPKfJjZKQwQo+W75
	NBDBZpGqLfWq+20ECzoP1NWfQkKJdkbHd2BDSWfDwg==
X-Google-Smtp-Source: AMrXdXt1VPRf5Qrcdy3mk9H7780cdO6g1p3VIEb2Iaqi3/NvNnSWViMH0oG2iS2J8ac4puLS4z8TluhGi/+NvlgT5BY=
X-Received: by 2002:a63:1706:0:b0:497:3785:812e with SMTP id
 x6-20020a631706000000b004973785812emr5230436pgl.13.1675114288305; Mon, 30 Jan
 2023 13:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301300732.QfTDtiab-lkp@intel.com> <7c25f24f-4acf-404e-88d0-65b55c017f34@app.fastmail.com>
In-Reply-To: <7c25f24f-4acf-404e-88d0-65b55c017f34@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 30 Jan 2023 13:31:16 -0800
Message-ID: <CAKwvOdkeM6bNaXds7YpHbVBBZvwGq-Jky32+88PzoBxCpsDHcw@mail.gmail.com>
Subject: Re: error: Undefined temporary symbol .LBB5_-1
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 30, 2023 at 2:06 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 30, 2023, at 00:48, kernel test robot wrote:
> > Hi Christophe,
> >
> > FYI, the error/warning still remains.
> >
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > master
> > head:   6d796c50f84ca79f1722bb131799e5a5710c4700
> > commit: a9f17d0c0778dd971dc9770fa0a2085a41d8c5e4 phy: ti: tusb1210: Fix
> > an error handling path in tusb1210_probe()
> > date:   10 months ago
> > config: arm-randconfig-r006-20230130
> > (https://download.01.org/0day-ci/archive/20230130/202301300732.QfTDtiab-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project
> > 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> > reproduce (this is a W=1 build):
>
> I reported this as a clang-16 regression, the tusb code looks fine:
>
> https://github.com/llvm/llvm-project/issues/60346

Thanks for the report.  I think I have a fix for this.
https://github.com/llvm/llvm-project/issues/60346#issuecomment-1409326875
clang-16 just branched, so once the fixes land, I'll make sure to
cherry-pick them to the clang-16 branch so that this issue is avoided
before the initial clang-16 release.

>
>      Arnd
>


-- 
Thanks,
~Nick Desaulniers
