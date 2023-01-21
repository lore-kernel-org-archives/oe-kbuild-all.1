Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C0386
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 04:00:22 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id a184so5347992pfa.9
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEkIaDChO+2RsoQoWOfnX1YOYZEJCJWnjwnoibRy7fk=;
        b=JqM0Bk+sbs4ED7pVnMTbAw78WFWkV1n8M1xI4VG/G7H90It1tYSI0bizGBXNLo4qBX
         MW5r0PA7sejIUChS+Uvqv0yige+Bd1PIKAcnDZV/g/iUyWiHtn6JxJS6KbpFzKWFZN5B
         j/52hfXF2FGuo7oD6yppdpySPZlojFXWjghT/OYo5DIVcAAvDEzgcjkQYwhs+BOxkraQ
         6muZDprG7tzNGSjvyuBF+giYFXp4xI+oLhCsX8eS8l1H6KG4SMYE4o1Bu1q/EXl5PLn9
         u8ZvER6aCHAzJSC7AKqpTWLvboOze5kVCYIVPA0xf1zyM8/LDaisC9apM6hnxIuvaUME
         bBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEkIaDChO+2RsoQoWOfnX1YOYZEJCJWnjwnoibRy7fk=;
        b=kR1l51GnySes7BYd4kx8ABDWAGmU93Tl3NYCWqJIrCmGGrsiRVCSx0LX6E7WXuzk4C
         +iFKvnszf14Gy9kSyii9EpCI20F5jwyR/BmC3sTuuhzc9kHS4/xQvG+7mxz3uwC0D4SN
         ARLjtIrEjHVncZKV1kWbKlK7CSt8vIrVWzehYa8h/n6EQrxMvqkFZLIZ5MiHdkuL71z/
         DXr15Xzl0nqQ/Vu3250kK4A7NaE2P4VA+7zS7HsZxzVKHw5ocwKdEwI2xWDLxJISE2nr
         TUomki8kmTPCj3SLHDk+T6fV4v1Pbhd7rdQ4ar/fypp0qjn2JHgA9cC/UImdCrbsohMZ
         1ibA==
X-Gm-Message-State: AFqh2kqvbqxkb99OQ5Qb/Qn1Hz01Jm8nyTU64xWE0e1PaMGihsXcYvWH
	jMRY6v35pcc4KylbmQpg/6E=
X-Google-Smtp-Source: AMrXdXuznDk3cfg9HYqQdC4fhK+ZDRlu3Aj3/OzS5gb/dCKLMEuYrcTAa6SEg5iM7KTzs6ePhjUmVA==
X-Received: by 2002:aa7:9557:0:b0:58a:66a8:edf5 with SMTP id w23-20020aa79557000000b0058a66a8edf5mr19413271pfq.3.1674273621699;
        Fri, 20 Jan 2023 20:00:21 -0800 (PST)
Received: from debian.me (subs02-180-214-232-22.three.co.id. [180.214.232.22])
        by smtp.gmail.com with ESMTPSA id n65-20020a622744000000b0058e12372079sm2532143pfn.29.2023.01.20.20.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 20:00:21 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id B1046104F59; Sat, 21 Jan 2023 11:00:17 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: CoreSight List <coresight@lists.linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	oe-kbuild-all@lists.linux.dev
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] Documentation: coresight: tpdm: Add dummy comment after sysfs list
Date: Sat, 21 Jan 2023 11:00:14 +0700
Message-Id: <20230121040015.28139-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121040015.28139-1-bagasdotme@gmail.com>
References: <202301210955.zYxDrLgv-lkp@intel.com>
 <20230121040015.28139-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=bagasdotme@gmail.com; h=from:subject; bh=cDkrRILdMU86JfH0ZzlHEMTUXiensM3OwqC9cWol5Eg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmnk/00n2ou55y27KDs109rGu/qMp1/8zolWEBjNee/iP7J mzM9O0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCR498Y/hkEnharXKH34P66h3KFs6 rMIj5cXTY5bbXqlh2pHbmmzNeBKu4Zsc0X81QzrK293OWSIMtxxc6J6aycveDrpklXE2PZAQ==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

kernel test robot reported htmldocs warning:

Documentation/trace/coresight/coresight-tpdm.rst:43: WARNING: Document may not end with a transition.

Since there is no more documentation left for TPDM, fix the warning by adding
dummy comment, thus creating the required text transition.

Link: https://lore.kernel.org/linux-doc/202301210955.zYxDrLgv-lkp@intel.com/
Fixes: 758d638667d474 ("Documentation: trace: Add documentation for TPDM and TPDA")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/coresight/coresight-tpdm.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/trace/coresight/coresight-tpdm.rst b/Documentation/trace/coresight/coresight-tpdm.rst
index 6c6e95109072fa..72fd5c855d459a 100644
--- a/Documentation/trace/coresight/coresight-tpdm.rst
+++ b/Documentation/trace/coresight/coresight-tpdm.rst
@@ -41,3 +41,5 @@ Root: ``/sys/bus/coresight/devices/tpdm<N>``
     value -  1 or 2.
 
 ----
+
+.. This text is intentionally added to make Sphinx happy.
-- 
An old man doll... just what I always wanted! - Clara

