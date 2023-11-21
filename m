Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714855C3D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 23:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxEP/kXp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso5380721b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 15:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700609866; x=1701214666; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBsM6IhveS+o7/r4qHHc1TgZJQzdQDusijV9f+awe9A=;
        b=SxEP/kXpdyqh0UfrZATx1QZYf0sIY21/OZDGb8lWkA8O/mHx7Q4pA/bRnH1SYriSOV
         Hw7+L2aohYqRa5elyEm6ZK1I7vg6elz3lz1X8XYZ5s3DxM6Cwdu0akdPfG6xwefA4465
         gLTKWV1YvlBa2//RYW+3hO5ojOCgg82+dthWA2+rb9pwjHWHpPpjcUsQFs+ightnWpgK
         7CORaBcGmKfZgt0zcSaxOV5GcbpDraplFDD8Dz78q2wY8sTn54Npr7YuopMHbHKibQ7V
         xHeMNdf2TVu/MARa3JzMz+jhXBLl7rRIhYS72c0ydVroqQWA2GyPQGXSqwEwPmll/2L6
         3Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700609866; x=1701214666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBsM6IhveS+o7/r4qHHc1TgZJQzdQDusijV9f+awe9A=;
        b=pMVPxM4Tlg3OqcS/nlhvGIuqBK9mZ4VmfJDSau6GCfPj/gMK1am5mPjYdzXDVBUyHe
         Nx1L51M17CPujZkwdS8RIBJFpvQU/fBSxr1Ag1Q2awpgbuY/nZF8m8AmogR725zxZygp
         Hzk8XOVZgs/3PudwODfTo07olKr3tDm3qzNPyFqzVUMqfRvZd6uv8YA5SJNIfiz5LnKm
         i7VL0gBdcZns0LkdGawU2te5UbWiKxZA2p6vR6E4WPO76z5hJGjJHdKGDiE/18AvDd0x
         aAGtUFagYOjH+jOlbizZW/R6eAO4UIiXLPXZndyk1MLJLAgKM587gcFCMSntvhN8IV3j
         3Fdw==
X-Gm-Message-State: AOJu0YxvnZPatYZHpiOuD9MMEZj4f4vhD/yYeO5moyRlm2JHjnjXkrqE
	+bnfmQuUhbdyzh6Pop8feTc=
X-Google-Smtp-Source: AGHT+IHylfg1T9X6BkuN5KOiJNcmxEeJ+UQfaRy0xEGLUcLwjosLbiBRBajuiM8h90cVFePNrmnm0g==
X-Received: by 2002:a05:6a20:3944:b0:189:c852:562e with SMTP id r4-20020a056a20394400b00189c852562emr636458pzg.38.1700609865663;
        Tue, 21 Nov 2023 15:37:45 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a19c500b0028098225450sm98849pjj.1.2023.11.21.15.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 15:37:45 -0800 (PST)
Message-ID: <a9abc5ec-f3cd-4a1a-81b9-a6900124d38b@gmail.com>
Date: Wed, 22 Nov 2023 06:37:39 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: xfs: consolidate XFS docs into its own
 subdirectory
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux XFS <linux-xfs@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Chandan Babu R <chandan.babu@oracle.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Dave Chinner <dchinner@redhat.com>, Steve French <stfrench@microsoft.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Allison Henderson <allison.henderson@oracle.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Charles Han <hanchunchao@inspur.com>
References: <20231121095658.28254-1-bagasdotme@gmail.com>
 <202311220333.acL7LwXY-lkp@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <202311220333.acL7LwXY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/23 03:04, kernel test robot wrote:
> Hi Bagas,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 98b1cc82c4affc16f5598d4fa14b1858671b2263]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bagas-Sanjaya/Documentation-xfs-consolidate-XFS-docs-into-its-own-subdirectory/20231121-180057
> base:   98b1cc82c4affc16f5598d4fa14b1858671b2263
> patch link:    https://lore.kernel.org/r/20231121095658.28254-1-bagasdotme%40gmail.com
> patch subject: [PATCH] Documentation: xfs: consolidate XFS docs into its own subdirectory
> reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220333.acL7LwXY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311220333.acL7LwXY-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: Documentation/filesystems/xfs/xfs-online-fsck-design.rst references a file that doesn't exist: Documentation/filesystems/xfs-self-describing-metadata.rst
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/filesystems/xfs-maintainer-entry-profile.rst
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/filesystems/xfs-*
>>> MAINTAINERS:53207: WARNING: unknown document: ../filesystems/xfs-maintainer-entry-profile
> 

Oh dear, I didn't catch them when building locally. Will fix anyway.

-- 
An old man doll... just what I always wanted! - Clara

