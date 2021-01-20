Content-Type: multipart/mixed; boundary="===============6970278391642993574=="
MIME-Version: 1.0
From: Ilya Dryomov <idryomov@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [kbuild] net/ceph/messenger_v1.c:1099:23: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Wed, 20 Jan 2021 13:52:44 +0100
Message-ID: <CAOi1vP_Zx2WrujeAa6+n615eFTMSost7qnzjWMQETQvKamKDug@mail.gmail.com>
In-Reply-To: <20210120124055.GG20820@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6970278391642993574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 1:43 PM Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>
> On Wed, Jan 20, 2021 at 12:01:59PM +0100, Ilya Dryomov wrote:
> > On Tue, Jan 19, 2021 at 8:46 PM Dan Carpenter <dan.carpenter@oracle.c=
om> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git   master
> > > head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
> > > commit: 2f713615ddd9d805b6c5e79c52e0e11af99d2bf1 libceph: move msgr1 =
protocol implementation to its own file
> > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > >
> > > cppcheck possible warnings: (new ones prefixed by >>, may not real pr=
oblems)
> > >
> > > >> net/ceph/messenger_v1.c:1099:23: warning: Boolean result is used i=
n bitwise operation. Clarify expression with parentheses. [clarifyCondition]
> > >      BUG_ON(!con->in_msg ^ skip);
> > >                          ^
> > >
> > > vim +1099 net/ceph/messenger_v1.c
> > >
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1033  static int read_parti=
al_message(struct ceph_connection *con)
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1034  {
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1035          struct ceph_m=
sg *m =3D con->in_msg;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1036          int size;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1037          int end;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1038          int ret;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1039          unsigned int =
front_len, middle_len, data_len;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1040          bool do_datac=
rc =3D !ceph_test_opt(from_msgr(con->msgr), NOCRC);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1041          bool need_sig=
n =3D (con->peer_features & CEPH_FEATURE_MSG_AUTH);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1042          u64 seq;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1043          u32 crc;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1044
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1045          dout("read_pa=
rtial_message con %p msg %p\n", con, m);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1046
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1047          /* header */
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1048          size =3D size=
of (con->in_hdr);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1049          end =3D size;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1050          ret =3D read_=
partial(con, end, size, &con->in_hdr);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1051          if (ret <=3D =
0)
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1052                  retur=
n ret;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1053
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1054          crc =3D crc32=
c(0, &con->in_hdr, offsetof(struct ceph_msg_header, crc));
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1055          if (cpu_to_le=
32(crc) !=3D con->in_hdr.crc) {
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1056                  pr_er=
r("read_partial_message bad hdr crc %u !=3D expected %u\n",
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1057                       =
  crc, con->in_hdr.crc);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1058                  retur=
n -EBADMSG;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1059          }
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1060
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1061          front_len =3D=
 le32_to_cpu(con->in_hdr.front_len);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1062          if (front_len=
 > CEPH_MSG_MAX_FRONT_LEN)
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1063                  retur=
n -EIO;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1064          middle_len =
=3D le32_to_cpu(con->in_hdr.middle_len);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1065          if (middle_le=
n > CEPH_MSG_MAX_MIDDLE_LEN)
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1066                  retur=
n -EIO;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1067          data_len =3D =
le32_to_cpu(con->in_hdr.data_len);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1068          if (data_len =
> CEPH_MSG_MAX_DATA_LEN)
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1069                  retur=
n -EIO;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1070
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1071          /* verify seq=
# */
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1072          seq =3D le64_=
to_cpu(con->in_hdr.seq);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1073          if ((s64)seq =
- (s64)con->in_seq < 1) {
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1074                  pr_in=
fo("skipping %s%lld %s seq %lld expected %lld\n",
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1075                       =
   ENTITY_NAME(con->peer_name),
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1076                       =
   ceph_pr_addr(&con->peer_addr),
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1077                       =
   seq, con->in_seq + 1);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1078                  con->=
in_base_pos =3D -front_len - middle_len - data_len -
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1079                       =
   sizeof_footer(con);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1080                  con->=
in_tag =3D CEPH_MSGR_TAG_READY;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1081                  retur=
n 1;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1082          } else if ((s=
64)seq - (s64)con->in_seq > 1) {
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1083                  pr_er=
r("read_partial_message bad seq %lld expected %lld\n",
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1084                       =
  seq, con->in_seq + 1);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1085                  con->=
error_msg =3D "bad message sequence # for incoming message";
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1086                  retur=
n -EBADE;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1087          }
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1088
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1089          /* allocate m=
essage? */
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1090          if (!con->in_=
msg) {
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1091                  int s=
kip =3D 0;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1092
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1093                  dout(=
"got hdr type %d front %d data %d\n", con->in_hdr.type,
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1094                       =
front_len, data_len);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1095                  ret =
=3D ceph_con_in_msg_alloc(con, &con->in_hdr, &skip);
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1096                  if (r=
et < 0)
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1097                       =
   return ret;
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12  1098
> > > 2f713615ddd9d805 Ilya Dryomov 2020-11-12 @1099                  BUG_O=
N(!con->in_msg ^ skip);
> > >
> > > ! has higher precedence than ^.  It's not clear that was intended
> > > necessarily.
> >
> > Hi Dan,
> >
> > This line and the surrounding code date back to 2013, commit
> > 2f713615ddd9 just moved it.  It is correct (we either get a message
> > to work with or get instructed to skip, in the latter case con->in_msg
> > is expected to be NULL), so I'm inclined to leave it as is.
>
> You could silence the warning and make the code look more intentional
> by writing it like this:
>
>         BUG_ON((!con->in_msg) ^ skip);

OK, I'll do that.

Thanks,

                Ilya
--===============6970278391642993574==--

