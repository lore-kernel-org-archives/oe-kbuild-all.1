Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03891FAA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jan 2023 08:07:01 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so6186969pjj.4
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Jan 2023 00:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6TWUIC0BEpSeE1eN600ESOfFAnoN2ZlVorKQAPh/eE=;
        b=B8sCBRSBpBWHV1G1kwXCOHQyLU5aHL5otb9bc9nlde9HbOycXXL2kBWUDfhWnv+FaK
         /QC1utk25qizg8d4kKOa+TZ3h2IKUjSXbzVt7pwycAQX0HZ80QFIXsG1RDrRndDMPNgq
         upTOyqpyudq+wo1JBL54/9yBJU7Qzn60+8Umvejji9osi4P5U/bQ+8Hxsl0FR/PHIs6Z
         pWjjIKsKpUw373xsgkxv3SKbTBCOd68CC9X4aDIOXKyDMYInZBMnrGeRlq0lKKixlv/Q
         Mfnua8wVCpqzg7Wy9Ar9QIZ0AclW0H/WCZXZSnepiOujI/Ecxw19J/OM1YWUmkKrbxtB
         05VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6TWUIC0BEpSeE1eN600ESOfFAnoN2ZlVorKQAPh/eE=;
        b=INVtz3dOyYcv+fMni9Pokr7e6u4PBRJPmGQBCNMsEBSsuKZ766POzUbMnzDUL+jtea
         7JrjZ5K0mTIclkIvZqALn6nr4JJ9h4KxDcb2KePe+wSAfuDoDwsBBLzOZnEerDepje5P
         +/6A9y+WQ0lYCAhMl1JsPmz+8X4spn+GIpm+UCmsmDI9Nuv1Q5o6dmshsXKm5mQ3Uaeq
         deJp5/tleO0SPoVrq6Rvc0xv+7ubvBPQlb0ibneLNZszdmIWeWlGXDtKjIZ+NuvdVS/1
         jdg63SqVBP1I+4JtNGX8l4liOKIgGmfC+m5Iyt87QtXDw/O74hOAI8t0NGSP18w8mjzD
         c2cQ==
X-Gm-Message-State: AFqh2kqC8BmE0GrHJMM7UFEDOUQw+AE4KS5EmjrXoiX5r9GaplqQSLFe
	xxsOFlfZUXr+Tscjo+9LX+w4ELEE/PMIEdQLqy5YtRkF9YwAMA==
X-Google-Smtp-Source: AMrXdXvN5L/oY59+PcP8g9ZdSf867gi3P+oFFpvCMPgkX/GEd4z8/Xo9VlAPMNFdRhsHthFt89CJClU/+xwHv1bPSdM=
X-Received: by 2002:a17:902:7592:b0:192:b77f:c4fa with SMTP id
 j18-20020a170902759200b00192b77fc4famr2676746pll.106.1673165221124; Sun, 08
 Jan 2023 00:07:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301062204.7kxE888T-lkp@intel.com> <CAJs=3_Dv=q77=OcuGX4cyL3MhZuqn+ygSk_t+p=ApRc4CEkGGw@mail.gmail.com>
 <20230108030227-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230108030227-mutt-send-email-mst@kernel.org>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Sun, 8 Jan 2023 10:06:24 +0200
Message-ID: <CAJs=3_DkfzF3WWgzWgsbDoKrP-cQrnRzp5HNQwmnA9oe1Bw-BQ@mail.gmail.com>
Subject: Re: [linux-next:master 1416/3037] drivers/vdpa/solidrun/snet_vdpa.h:193:6:
 warning: no previous prototype for 'psnet_create_hwmon'
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

> best send a new version with all the fixes applied (snprintf size
> thing too).

Sure.
