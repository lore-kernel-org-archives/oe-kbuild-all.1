Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB976813
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 20:40:58 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3e699254ac4so8634441cf.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1681591258; x=1684183258;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5ZpJOS2H9PgGp4Q72WdTfSs9gPQF5dEYfpY40h9OUQ=;
        b=UzU//76cztdU1LgexNLanS+PonvEY1gfbmf2XiwBHWabM0B+HR+5mkKYMsJklwCCn/
         D5bcRCSYS143FhZdjgcNigSfttd9A+nUNaSO8oI9FcIbEQcL+e5M6JLXwQJ36h5j4cWw
         9Y87Z871/OiG5GP0uPnJxCGb0J1Q3je9mvsT5eLZICyaQaXJFk38RCH6wZI6fMyCoA03
         ig/CUVoT4ZH8CnNByrhBkIojoU+mZC+T/3OV1nMOMHShB6czLciDHtzBzG6WajheDuS0
         mpGwt9J6iuTLkiRY8Nv8/67dpQ4L1Q51NpHQLMMqBDZGgRUPlFtGugqsj/pi8PLZ9Rgm
         NeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681591258; x=1684183258;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5ZpJOS2H9PgGp4Q72WdTfSs9gPQF5dEYfpY40h9OUQ=;
        b=ayAwA7bfAGNEJtph+xjZ1y3Hk/yTKc8allDbV0l8qoYFEMwdt9xdZJEYFTEjbgQkD9
         2FNq4uu5/qN0CYkWoMYuJ2suGP2ucPqvIugClQ7I09UL4VEL3LTZoKC/xMygUaFYWcsq
         bWsYOEZEMEo4X3g4HVB7Qm5aLQCm6tS7pwAQyNLCFEOFwZFpFvuGkb6e1dlCRQVLrZwG
         U8/ZGT74cO9WtJlYMdjSkVwxGnaLN8jni1Tv3rFiqW4JpeBbsYzihUMCDtDGkHV+p/mx
         8S9fjXrtfEDMcXVnJnp1uYx5kOMEZLhijAyY6bwSsL2QQkFWCLXn2ob2Ju/rUQqu849x
         aXXA==
X-Gm-Message-State: AAQBX9eJZyBjFt25FFydyCaGku1HJ9v9w7mLOrxi6QWd0KuV4/xEVvl6
	0iEPw2UfWsWz8AYe+lRjB++tHQ==
X-Google-Smtp-Source: AKy350b7Jgq/iFYYGf1L3SXkiJAspR6o8DYiL85urxLnUkV+LsBU0p8W38LeUr7ZJa9KfcGW8yLuuw==
X-Received: by 2002:a05:6214:3011:b0:5ef:5132:7ad7 with SMTP id ke17-20020a056214301100b005ef51327ad7mr9930130qvb.2.1681591257782;
        Sat, 15 Apr 2023 13:40:57 -0700 (PDT)
Received: from [127.0.0.1] ([216.250.210.6])
        by smtp.gmail.com with ESMTPSA id pp26-20020a056214139a00b005dd8b934571sm1996244qvb.9.2023.04.15.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 13:40:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: lkp@intel.com, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, shinichiro.kawasaki@wdc.com, 
 chaitanyak@nvidia.com, akpm@linux-foundation.org, hch@infradead.org
In-Reply-To: <20230415125705.180426-1-akinobu.mita@gmail.com>
References: <202304150025.K0hczLR4-lkp@intel.com>
 <20230415125705.180426-1-akinobu.mita@gmail.com>
Subject: Re: [PATCH -block] fault-inject: fix build error when
 FAULT_INJECTION_CONFIGFS=y and CONFIGFS_FS=m
Message-Id: <168159125392.9478.18069985091201670556.b4-ty@kernel.dk>
Date: Sat, 15 Apr 2023 14:40:53 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303


On Sat, 15 Apr 2023 21:57:05 +0900, Akinobu Mita wrote:
> This fixes a build error when CONFIG_FAULT_INJECTION_CONFIGFS=y and
> CONFIG_CONFIGFS_FS=m.
> 
> Since the fault-injection library cannot built as a module, avoid building
> configfs as a module.
> 
> 
> [...]

Applied, thanks!

[1/1] fault-inject: fix build error when FAULT_INJECTION_CONFIGFS=y and CONFIGFS_FS=m
      commit: 5347c9321845e5a94be19ea951746d4f2b8b194f

Best regards,
-- 
Jens Axboe



