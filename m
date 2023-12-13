Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BBB5CD2F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP/krroX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d35dc7e1bbso3050795ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 07:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702482168; x=1703086968; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNspfJlVqkGI+84+zJiCPcimkPN1petzpe1fNUwvChk=;
        b=SP/krroXYItpUsNQmF/NiyoU1tol1FOaR6fogxlNvAdQnFW086CCYVylZf28dJqvLZ
         pw5k6OqKUtVLy5/o52hYrpyuXXW2hPaBigZNd/uJh53cZo0QA0SSjbafvqR+ROR6xo56
         RnQs1CR91Hx+6idEEd+4rx2VeGL0p+AlOjtqsBGFNpIhtsoQgcYao+XxUITHk0MFWN+h
         AlTtGa95PMZvn9xmg5vY9nhIzYdkM838ClNeiIZsc+zoCnsOY9txpjduvZ+ggmTlHq9C
         xxbn7ExcBz3el0RLO5CS7h+5LNKE/XPniW6bLYtz/dPp3rAGx943HtZpBKOE3IpnOqe+
         YX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482168; x=1703086968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNspfJlVqkGI+84+zJiCPcimkPN1petzpe1fNUwvChk=;
        b=GfOUlhJerzgeg8hNe8cf85PMyZ9IFJjCYFxsIyTGZzUxVDJGOFqGgG+vewGXLvHGF2
         2mXUU0QmW2l3701JJ9lLlyLM3uE0Hp3bIXunpJsbJbS67dz8XYMFtbvxoXPnyA+7rfaf
         C+RoS7HOJhk+ZYGZrhbhxUzHklC/KlfoHEzKGpPvt5j7eJXXRCp8PIvocvzmK+jIU3jt
         eUvk3NMlXd15jCV1IMzvozaDUS3BBe+xqLe0NPwXN1PnHmZT24DXWWt9NhXBb6KOEyiH
         VppgfLEAMnh9SmkeIsQnAHxZgkFLIjqt2imD3ftWtsLYs0NcBJuZWhBKdjAo3Ui8JVH1
         hQ3g==
X-Gm-Message-State: AOJu0YxLDiUp/cbpQVRPtTE5pOmfdxczxR0bxuTMnkr+szIVbgB1tz8a
	24jx4wAcoEqunkG1hMwWSYE=
X-Google-Smtp-Source: AGHT+IHBOmXf4W3D6sBHrUVLG4Oj7Nofh5iZLh4OH7v6/MiahFsCTPrQJunt/keLomAhjqB+bETPbA==
X-Received: by 2002:a17:903:244e:b0:1d0:cd48:e05c with SMTP id l14-20020a170903244e00b001d0cd48e05cmr10561199pls.75.1702482167534;
        Wed, 13 Dec 2023 07:42:47 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id jf18-20020a170903269200b001d087d2c42fsm10685463plb.24.2023.12.13.07.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 07:42:47 -0800 (PST)
Message-ID: <d58dd14b-1a61-4377-9477-1af1346147a5@gmail.com>
Date: Thu, 14 Dec 2023 00:42:44 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: sphinx/requirement.txt: Reflect recommended Sphinx
 version
To: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <50830030-dca7-4c43-bcc8-449c7cfa9fbb@gmail.com>
 <202312120740.HxQGwUoL-lkp@intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <202312120740.HxQGwUoL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023/12/12 8:27, kernel test robot wrote:
> Hi Akira,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v6.7-rc5 next-20231211]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Akira-Yokosawa/docs-sphinx-requirement-txt-Reflect-recommended-Sphinx-version/20231210-074628
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/50830030-dca7-4c43-bcc8-449c7cfa9fbb%40gmail.com
> patch subject: [PATCH] docs: sphinx/requirement.txt: Reflect recommended Sphinx version
> reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120740.HxQGwUoL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312120740.HxQGwUoL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:344: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:39.
>>> Documentation/gpu/drm-kms:461: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:49.
>>> Documentation/gpu/drm-uapi:434: ./drivers/gpu/drm/drm_ioctl.c:928: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:70.
> 

These warnings on duplicate C decl are expected when you upgrade
Sphinx to >= 3.1.
See https://github.com/sphinx-doc/sphinx/issues/7819 for the long
standing bug of Sphinx. 

Anyway, I can't do anything in response to this report.

Regards,
Akira
