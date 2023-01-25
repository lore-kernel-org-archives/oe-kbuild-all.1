Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798476FA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 18:14:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id g11so17253401eda.12
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezfgQvWoMwYi/wrVPbQBarXLnM5cDi1r4h1toUfXH6c=;
        b=cGn+xBZGLUGvEEQSQEj8q7PiKeDnCb14P3MOhmCCN3HhQSOmIsRjhNBB9kLQOgJPtI
         GZ3CutDFj51OwAyR8zxU2JURtxQbRtWIqvZu3wP4Di9u47Vcx6QSh1pJH4SxN8OQBniG
         YcphD1DbWFqQSMYnIEjB7qrG4s9fhM/3URZsILyle9KPNXUW/Ie1SfVlA4MevrKHCkm3
         p3YkCb9f8dmb7utnp3xYktANPPhrv9eJtYKT+P9YEWUI2htA35cEjMp5ImYJvzxExC2F
         o3R+nMif1e2BDalQApSuF2LB8IhPhh/pLT/Yj9PWnW5F7d/JKd2ZEE5cmwiwDGVKoD+G
         0iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezfgQvWoMwYi/wrVPbQBarXLnM5cDi1r4h1toUfXH6c=;
        b=DjH9s4N3JsoyowQfBGZe+d0vvxY5yCiuyBHsdTUy7QxY2RvWVlU77ZOiEunJvVH5Na
         URgZ6Lfs1MJslADQYpDUW3ltoJBHe2pg0fcoV+0r09/CNRP24ocnI+geqpVbHcraEtjn
         XImC3VcIaJ8NNrt3Q7f3et0NxJaJBjz1P+G3SjxzMNMYg5ZUwZ+zOVb2Hozn28UlTcZ4
         rUnMw2JEdKt/5X6V9OsGUl3tnP+SwMpOUPPA4gCtLBINAPDSh905WUF5gxrY1hzlSIsw
         oSD7caky5yy4pfnav9van3Y+fdb8bt3Y+J1Er0MsxJFgaXCzTBxfKWtplknmskatgz+9
         kMyg==
X-Gm-Message-State: AFqh2kqJjz4si2HvdcxjHyxKop3CKywQd4zV52Y9lcxJfdPjlsD1xxBD
	rgxld0frwEKLk7ggS21wYKzjPVaRdbmi2MwOItXiTZOWxJcz66h1
X-Google-Smtp-Source: AMrXdXuT6xMFHJVZ5QLk/+wQjDgjKjQNWw0t82BBGNsYvY9n1cbbZqP0y0Ny/YOsHABz+zn+gawW9hmxBLs+nRoPRDk=
X-Received: by 2002:a05:6402:2054:b0:498:216:ee4c with SMTP id
 bc20-20020a056402205400b004980216ee4cmr4403222edb.29.1674670478499; Wed, 25
 Jan 2023 10:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230125015738.912924-2-zokeefe@google.com> <202301252110.hFYRsbrm-lkp@intel.com>
In-Reply-To: <202301252110.hFYRsbrm-lkp@intel.com>
From: "Zach O'Keefe" <zokeefe@google.com>
Date: Wed, 25 Jan 2023 10:14:01 -0800
Message-ID: <CAAa6QmTjn-Lnw9Sj80RCaCWmqehDSdRJVp0923UUTD68jMqoDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/MADV_COLLAPSE: catch !none !huge !bad pmd lookups
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Yang Shi <shy828301@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Apologies here; shouldn't have overlooked the 4 line change. Will
follow-up with a v2 here in a second.
