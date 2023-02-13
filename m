Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156E2568
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 10:08:15 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id z1so12971977plg.6
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 02:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugRQK904zzFTwVCKbpQrAxmhP0UfgjZkfjF85IDqdqU=;
        b=TLiPErZCC+XSJcT/ajHqEzSQxSSJ9qaeZ3vz+HQLGQ9plAKLl9fpCljXvVOWHW/cYJ
         uOXxZB0QcqpPNvidpEUFj/XKctK3hxxb7OX9d9WbXswlCjCfTt87ueVnanF3hmt6ImRe
         nFE+svYz9Tyrxgeyw0XRSNiH35X8tp5CYhwwFl/bw+JIGu5nMfI+ouspDXiWnU+uhPRj
         F9zS9kDtD4FzrjT3Vs6MWSrwm1pbvtvu21tDiEEa1XPn4xQOHlyxXkLSH/RU8F9E0z3w
         OxoPATya6N/sWskfZxq+E/xkE1wVD+jt8xdoNQ7DtxxmVX5x+EgVymtG0Ng2K1rvFhir
         qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugRQK904zzFTwVCKbpQrAxmhP0UfgjZkfjF85IDqdqU=;
        b=KCQv97BH/FVgEk94S/Il/SVj3cA2ALHnoU1ia8vGjUEuU8OqTxVR1JK4jkIXZhWv4r
         xcg2fJaNbRaddMJg6QPE5x8nKQtwPG8U29MXL4+ICqBAPWyXFHuxFO84lNky/mRI/cvq
         AWy+WJm90nOavIgi4ao8aEqMvKqQyEguwzciOJeCIQuZRpyY16vKsSbFGtFgIOi6hmUW
         HFLDeCgMWybSahze/QHNbt3c6xXn101TvmWPac0gzMKnTnvHxSGXgo+y171X4068lemI
         Uqyq4bJis2tYDHlnirPv2ePWmvge8T99D9JSpmdT/xIi/o/FVsABubjB/DC8thMB2phl
         RUcw==
X-Gm-Message-State: AO0yUKV/0ihQgYn4jLfXA6pc5ubdSu8Wzc4bld81Jo3OvKfvqn775rF6
	k7xnzffgaITGus2PByex1QQ=
X-Google-Smtp-Source: AK7set9LCSXaCy37+yCxivnxCoh+yJAeR8sZp1Cjvs6PFbfMFupeDrg8jNy+S3yqXWy8FDOTXPWNEg==
X-Received: by 2002:a17:902:b10b:b0:198:ec00:81bb with SMTP id q11-20020a170902b10b00b00198ec0081bbmr17826956plr.53.1676282895123;
        Mon, 13 Feb 2023 02:08:15 -0800 (PST)
Received: from debian.me (subs02-180-214-232-93.three.co.id. [180.214.232.93])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709026b8b00b001992b8cf89bsm7824390plk.16.2023.02.13.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 02:08:14 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id C9D7710558B; Mon, 13 Feb 2023 17:08:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Arjan van de Ven <arjan@linux.intel.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH 0/3] Documentation fixes for thermal/bleeding-edge
Date: Mon, 13 Feb 2023 17:07:58 +0700
Message-Id: <20230213100800.28333-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=bagasdotme@gmail.com; h=from:subject; bh=iYKVollfv757SaRCcyO0xXQVSwKRN4TnoZ3u/fIdVss=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmvuP8zXqxttd7DWjRDQ/Hic77rM7o+bP+7WnTB/VSDn8bL +vMlO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjAR7v0M/50O/urWXvsn7q2P0ny2F2 p7ss4zt0ckPT32ppVTYuO0nxGMDI3fkm+8n3HuBf8Ef7b8B8tvZPKJPLRaq8EXFCkknJzzkhUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Here are documentation fixes for thermal/bleeding-edge tree. The
first two patches are fixes to recently reported kernel test robot
reports whereas the third patch is cosmetical (formatting).

Bagas Sanjaya (3):
  Documentation: admin-guide: Add toctree entry for thermal docs
  Documentation: powerclamp: Escape wildcard in cpumask description
  Documentation: powerclamp: Fix numbered lists formatting

 Documentation/admin-guide/index.rst               |  2 +-
 Documentation/admin-guide/thermal/index.rst       |  8 ++++++++
 .../admin-guide/thermal/intel_powerclamp.rst      | 15 +++++++++------
 3 files changed, 18 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/admin-guide/thermal/index.rst


base-commit: 1c7337f9eef60b8ce8a4b8c96d197e230d60b6b2
-- 
An old man doll... just what I always wanted! - Clara

