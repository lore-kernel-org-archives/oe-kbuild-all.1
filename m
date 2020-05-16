Content-Type: multipart/mixed; boundary="===============4713308219319199098=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC, WIP, v5 10/10] media: vidtv: Add a MPEG Transport Stream Multiplexer
Date: Sat, 16 May 2020 08:59:05 +0800
Message-ID: <202005160805.69KztOBC%lkp@intel.com>
In-Reply-To: <20200515214815.15514-11-dwlsalmeida@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4713308219319199098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on next-20200515]
[cannot apply to v5.7-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Daniel-W-S-Almeida/media-v=
idtv-implement-a-virtual-DVB-driver/20200516-055059
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/test-drivers/vidtv/vidtv_psi.c:64:43: sparse: sparse: Usin=
g plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:174:43: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:261:43: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:297:43: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:512:50: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:513:50: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:514:50: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:702:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:703:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:704:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:705:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:852:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:853:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:854:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_psi.c:855:44: sparse: sparse: Usi=
ng plain integer as NULL pointer
--
>> drivers/media/test-drivers/vidtv/vidtv_pes.c:83:54: sparse: sparse: miss=
ing braces around initializer
   drivers/media/test-drivers/vidtv/vidtv_pes.c:84:54: sparse: sparse: miss=
ing braces around initializer
   drivers/media/test-drivers/vidtv/vidtv_pes.c:142:54: sparse: sparse: mis=
sing braces around initializer
   drivers/media/test-drivers/vidtv/vidtv_pes.c:143:54: sparse: sparse: mis=
sing braces around initializer
>> drivers/media/test-drivers/vidtv/vidtv_pes.c:303:59: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_pes.c:304:59: sparse: sparse: Usi=
ng plain integer as NULL pointer
>> drivers/media/test-drivers/vidtv/vidtv_pes.c:96:47: sparse: sparse: shif=
t count is negative (-1)
   drivers/media/test-drivers/vidtv/vidtv_pes.c:105:47: sparse: sparse: shi=
ft count is negative (-1)
   drivers/media/test-drivers/vidtv/vidtv_pes.c:117:47: sparse: sparse: shi=
ft count is negative (-1)
--
>> drivers/media/test-drivers/vidtv/vidtv_s302m.c:404:42: sparse: sparse: m=
issing braces around initializer
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:427:45: sparse: sparse: m=
issing braces around initializer
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:428:45: sparse: sparse: m=
issing braces around initializer
--
>> drivers/media/test-drivers/vidtv/vidtv_channel.c:59:62: sparse: sparse: =
Using plain integer as NULL pointer
--
>> drivers/media/test-drivers/vidtv/vidtv_mux.c:163:39: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_mux.c:205:39: sparse: sparse: Usi=
ng plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_mux.c:267:47: sparse: sparse: Usi=
ng plain integer as NULL pointer

vim +64 drivers/media/test-drivers/vidtv/vidtv_psi.c

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   36  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   37  static u32
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   38  vidtv_psi_ts_psi_write=
_into(struct psi_write_args args)
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   39  {
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   40  	/*
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   41  	 * Packetize PSI sect=
ions into TS packets:
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   42  	 * push a TS header (=
4bytes) every 184 bytes
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   43  	 * manage the continu=
ity_counter
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   44  	 * add stuffing after=
 the CRC
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   45  	 */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   46  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   47  	u32  nbytes_past_boun=
dary =3D (args.dest_offset % TS_PACKET_LEN);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   48  	bool aligned         =
     =3D nbytes_past_boundary =3D=3D 0;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   49  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   50  	/*
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   51  	 * whether we need to=
 fragment the data into multiple ts packets
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   52  	 * if we are aligned =
we need to spare one byte for the pointer_field
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   53  	 */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   54  	bool split =3D (align=
ed) ?
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   55  		     args.len > TS_P=
AYLOAD_LEN - 1 :
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   56  		     nbytes_past_bou=
ndary + args.len > TS_PACKET_LEN;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   57  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   58  	/* how much we can wr=
ite in this packet */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   59  	u32 payload_write_len=
 =3D (split) ?
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   60  				(aligned)     ? TS=
_PAYLOAD_LEN       :
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   61  				TS_PACKET_LEN - nb=
ytes_past_boundary :
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   62  				args.len;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   63  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  @64  	struct psi_write_args=
 new_args =3D {0};
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   65  	struct vidtv_mpeg_ts =
ts_header =3D {0};
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   66  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   67  	u32 nbytes =3D 0;  /*=
 number of bytes written by this function */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   68  	u32 temp   =3D 0;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   69  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   70  	/* Just a sanity chec=
k, should not really happen because we stuff
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   71  	 * the packet when we=
 finish a section, i.e. when we write the crc at
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   72  	 * the end. But if th=
is happens then we have messed up the logic
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   73  	 * somewhere.
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   74  	 */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   75  	if (args.new_psi_sect=
ion && !aligned) {
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   76  		pr_warn_ratelimited(=
"Cannot write a new PSI section in a misaligned buffer\n");
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   77  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   78  		/* forcibly align an=
d hope for the best */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   79  		nbytes +=3D vidtv_me=
mset(args.dest_buf,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   80  				       args.dest_o=
ffset + nbytes,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   81  				       args.dest_b=
uf_sz,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   82  				       TS_FILL_BYT=
E,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   83  				       TS_PACKET_L=
EN - nbytes_past_boundary);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   84  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   85  		aligned =3D true;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   86  	}
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   87  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   88  	if (aligned) {
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   89  		/* if at a packet bo=
undary, write a new TS header */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   90  		ts_header.sync_byte =
         =3D TS_SYNC_BYTE;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   91  		ts_header.tei       =
         =3D 0;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   92  		ts_header.payload_st=
art      =3D 1;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   93  		ts_header.pid       =
         =3D args.pid;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   94  		ts_header.priority  =
         =3D 0;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   95  		ts_header.scrambling=
         =3D 0;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   96  		ts_header.continuity=
_counter =3D *args.continuity_counter;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   97  		ts_header.payload   =
         =3D 1;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   98  		/* no adaptation fie=
ld */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15   99  		ts_header.adaptation=
_field =3D 0;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  100  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  101  		/* copy the header */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  102  		nbytes +=3D vidtv_me=
mcpy(args.dest_buf,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  103  				       args.dest_o=
ffset + nbytes,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  104  				       args.dest_b=
uf_sz,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  105  				       &ts_header,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  106  				       sizeof(ts_h=
eader));
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  107  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  108  		/*
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  109  		 * increment the cou=
ntinuity counter since we have started a new
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  110  		 * packet
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  111  		 *
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  112  		 * This will trigger=
 a discontinuity if the buffer is full,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  113  		 * which is what we =
want: the continuity counter will be
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  114  		 * incremented but n=
othing will get copied by
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  115  		 * vidtv_memcpy/vidt=
v_memset, effectively dropping the packet.
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  116  		 */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  117  		vidtv_ts_inc_cc(args=
.continuity_counter);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  118  	}
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  119  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  120  	if (args.new_psi_sect=
ion) {
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  121  		/* write the pointer=
_field in the first byte of the payload */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  122  		temp =3D vidtv_memse=
t(args.dest_buf,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  123  				    args.dest_offs=
et + nbytes,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  124  				    args.dest_buf_=
sz,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  125  				    0x0,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  126  				    1);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  127  		/* one byte was used=
 by the pointer field*/
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  128  		nbytes +=3D temp;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  129  		if (payload_write_le=
n =3D=3D TS_PAYLOAD_LEN)
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  130  			payload_write_len -=
=3D temp;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  131  	}
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  132  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  133  	/* write as much of t=
he payload as we possibly can */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  134  	nbytes +=3D vidtv_mem=
cpy(args.dest_buf,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  135  			       args.dest_of=
fset + nbytes,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  136  			       args.dest_bu=
f_sz,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  137  			       args.from,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  138  			       payload_writ=
e_len);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  139  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  140  	if (split) {
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  141  		/* 'payload_write_le=
n' written from a total of 'len' requested*/
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  142  		args.len -=3D payloa=
d_write_len;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  143  		/*
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  144  		 * recursively write=
 the rest of the data until we do not
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  145  		 * need to split it =
anymore
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  146  		 */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  147  		memcpy(&new_args, &a=
rgs, sizeof(struct psi_write_args));
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  148  		new_args.from       =
     =3D args.from + payload_write_len;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  149  		new_args.dest_offset=
     =3D args.dest_offset + nbytes;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  150  		new_args.new_psi_sec=
tion =3D false;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  151  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  152  		nbytes +=3D vidtv_ps=
i_ts_psi_write_into(new_args);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  153  	}
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  154  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  155  	/*
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  156  	 * as the CRC is last=
 in the section, stuff the rest of the
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  157  	 * packet if there is=
 any remaining space in there
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  158  	 */
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  159  	if (args.is_crc)
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  160  		nbytes +=3D vidtv_me=
mset(args.dest_buf,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  161  				       args.dest_o=
ffset + nbytes,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  162  				       args.dest_b=
uf_sz,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  163  				       TS_FILL_BYT=
E,
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  164  				       TS_PACKET_L=
EN - payload_write_len);
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  165  =

07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  166  	return nbytes;
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  167  }
07dd2778c1ca46 Daniel W. S. Almeida 2020-05-15  168  =


:::::: The code at line 64 was first introduced by commit
:::::: 07dd2778c1ca4652a340f23dfb44bab57e1e6066 media: vidtv: implement a P=
SI generator

:::::: TO: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4713308219319199098==--

