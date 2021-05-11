Content-Type: multipart/mixed; boundary="===============2656475835669098178=="
MIME-Version: 1.0
From: Florent Revest <revest@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf] bpf: Fix nested bpf_bprintf_prepare with more per-cpu buffers
Date: Tue, 11 May 2021 10:09:32 +0200
Message-ID: <CABRcYmK+iEMy-DOp2tyaAVGfQMwhyeZGGs-LyO_RYfFprbs34A@mail.gmail.com>
In-Reply-To: <202105110911.f084GH7J-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2656475835669098178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 3:58 AM kernel test robot <lkp@intel.com> wrote:
>    kernel/bpf/helpers.c:718:23: error: use of undeclared identifier 'bpf_=
bprintf_buf'; did you mean 'bpf_bprintf_bufs'?

Ugh, reminder to self: don't zealously rename variables just before
sending a patch out.

I'm sending a v2, sorry for the noise.
--===============2656475835669098178==--

