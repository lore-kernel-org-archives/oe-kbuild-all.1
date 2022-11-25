Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355DC7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Nov 2022 03:43:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id jn7so2888091plb.13
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Nov 2022 19:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHe1NBZkg23Y1ePxgOuhPSLDMktv7jzFjfTel+sqKQw=;
        b=VJQuZWb1DX0aab1jd+x+eX6c018kSvd7JTm/8zk3l+l1RIsueZHnh6QYJtS34pYLP0
         yZml3Wf/MwqJnwlaGEvNdg7+s4G7nYrfLrQn8SrjzlIkEikXWljeRMYo22OYVZF+VJPG
         vqrREwPU3yj7Va1CVNsScH2xDkqAHskPyLbcOhra2SxV6+uNlPW6C0wD4vJIHUN1quEH
         5Hi4f6XZnQL0aWoL38JEkr40trFJOonvcPGsuelveoKhTUu3UzL8ejCO+qIFSnxsIeSB
         Gu6OjlWaEfj9JsWYRcaIPqBJlWxm+D+hEFJ84XbHWYBfNawotvm6MOlicxCZQO+tc+2x
         rw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHe1NBZkg23Y1ePxgOuhPSLDMktv7jzFjfTel+sqKQw=;
        b=WblAmEQlobeteX9W/DVQ+ZGQJAmgB3StcCtrKZQJKL5KMLLjGeoCUkUrGOPHoaaVBZ
         g7FAB7FnHxoWDrwNPt6/jngyt6zdL+4G30TajlH/72etQ48Z0VDmkB5f2nUjwLrXdwWH
         tPNsmVfIpkvoAFqva9C6rm0gjhZZsDxEEsA8/Bp3vDNun447oN5VIXTW8c8vTvpTkux8
         tdssxytqzUj3u/6zHp7E0WAlhdfGVim2kVWAqveRMOQWK2z8pAE4rFIPPnDuCE+0yOE0
         7gjX8smh0bM2KLMOD8fJqp/tgFCVhZGN7BpKNdQrpS3ipRoYUs9ucu6JeR2YeTbNkc9S
         G6Og==
X-Gm-Message-State: ANoB5pn73667ButuFb+DAgPExHY7sOgp4xg/ybbOpGAoi8HTmQbmeLom
	pWc5TISQkeARbzLxBw5sfKs=
X-Google-Smtp-Source: AA0mqf458Hi/OjHfUCkwvdmG9OHaDRIkvfLH2+zyFVuDUkm4vcYv8qymGfYiyXBPoUx7BwpnDSwaPA==
X-Received: by 2002:a17:90a:d681:b0:213:d08f:a455 with SMTP id x1-20020a17090ad68100b00213d08fa455mr45074809pju.130.1669347796539;
        Thu, 24 Nov 2022 19:43:16 -0800 (PST)
Received: from debian.me (subs02-180-214-232-73.three.co.id. [180.214.232.73])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090abb0f00b0021885b05660sm1892378pjr.24.2022.11.24.19.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 19:43:16 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 564F6104368; Fri, 25 Nov 2022 10:43:12 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Documentation/osnoise: escape underscore of NO_ prefix
Date: Fri, 25 Nov 2022 10:43:00 +0700
Message-Id: <20221125034300.24168-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <202211240447.HxRNftE5-lkp@intel.com>
References: <202211240447.HxRNftE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; i=bagasdotme@gmail.com; h=from:subject; bh=8q+Zei6xodqHKZunw7osmhH6R06srFtMBHc9ewN+LBA=; b=owGbwMvMwCH2bWenZ2ig32LG02pJDMkNlke4li5d7DRhol3Sgs5pigv/9Z/2dv105oiCVWTzba/H vAybO0pZGMQ4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRKCmGf5rvgnS1Gf4Fn896MU3kyU Ov8ANbrcqn+qxq+eZu8Y5njxPDP7tzn+7EqahFT5gYGeHLIDX7fqn1xe6Euhmqz5hXZy/K5wQA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

kernel test robot reported unknown target name warning:

Documentation/trace/osnoise-tracer.rst:112: WARNING: Unknown target name: "no".

The warning causes NO_ prefix to be rendered as link text instead, which
points to non-existent link target.

Escape the prefix underscore to fix the warning.

Link: https://lore.kernel.org/linux-doc/202211240447.HxRNftE5-lkp@intel.com/
Fixes: 67543cd6b8eee5 ("Documentation/osnoise: Add osnoise/options documentation")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/osnoise-tracer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/osnoise-tracer.rst b/Documentation/trace/osnoise-tracer.rst
index 3c675ed82b27ae..fdd562d7c22d18 100644
--- a/Documentation/trace/osnoise-tracer.rst
+++ b/Documentation/trace/osnoise-tracer.rst
@@ -111,7 +111,7 @@ The tracer has a set of options inside the osnoise directory, they are:
    be used, which is currently 5 us.
  - osnoise/options: a set of on/off options that can be enabled by
    writing the option name to the file or disabled by writing the option
-   name preceded with the 'NO_' prefix. For example, writing
+   name preceded with the 'NO\_' prefix. For example, writing
    NO_OSNOISE_WORKLOAD disables the OSNOISE_WORKLOAD option. The
    special DEAFAULTS option resets all options to the default value.
 

base-commit: bd604f3db49c5b21171abea0414a2020dcbf2646
-- 
An old man doll... just what I always wanted! - Clara

